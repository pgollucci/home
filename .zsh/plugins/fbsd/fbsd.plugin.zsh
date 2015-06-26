_rdir=$HOME/repos/fbsd
_zpool=$(awk -F= '/ZPOOL/ {print $2}' $_rdir/poudriere/src/etc/poudriere.conf)
_zports=$(awk -F= '/ZPORTS/ {print $2}' $_rdir/poudriere/src/etc/poudriere.conf)
_poudriere_dir=/usr/local/poudriere
_poudriere_data=$_poudriere_dir/data
_poudriere_ports=$_poudriere_dir/ports

_arches="i386 amd64"
_build_tags="8.4-RELEASE 9.3-RELEASE 10.1-RLEASE 11.0-CURRENT"
_builds=$(echo $_build_tags |sed -e 's,-.*,,' -e 's,\.,,g')

alias cdpdir='cd $PORTSDIR'
if [ -d $_rdir ]; then
  for d in `cd $_rdir ; /bin/ls -1d *`; do
    alias cd$d="cd $_rdir/$d"
  done
fi

function poud_packages () {

  if [ `id -u` != 0 ]; then
    echo "need to be root"
    return
  fi

  pkg delete -af -y
  pkg bootstrap -y
  pkg install -y bash-static emacs-nox11 git-subversion hub rsync sudo tmux vim-lite zsh
}

function poud_ptree () {

  [ -n "$1" ] && \
      PORTSDIR=$_poudriere_ports/$1 && export PORTSDIR && \
      _pdir=$1 && export _pdir

  echo $PORTSDIR
}

function poud_mfi () {

  cd $PORTSDIR ; make fetchindex
}

function poud_nuke_builds () {

  sudo find $_poudriere_data \( -name "*i386*" -o -name "*amd64*" \) | xargs sudo rm -rf
  sudo rm -rf $_poudriere_data/logs/bulk/.data.json
}

function poud_build () {
  local build=$1;
  local port=$2

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  tmux new -s $build "sudo poudriere bulk -t -B ${build}-$(echo $port |sed -e 's,/,_,g') -j ${build} $port"
}

function poud_bulk () {
  local port=$1

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  builds=$(poudriere jail -l -n -q)
  for build in `echo $builds`; do
    sudo poudriere bulk -t -B ${build}-default-$(echo $port |sed -e 's,/,_,g') -j ${build} $port &
  done
}

function poud_bulk_all () {
  local build=$1

  tmux new -s $build "sudo poudriere bulk -t -B ${build}-default -j ${build} -a"
}

function poud_go () {
  local port=$1

  dir=$(poud_pi dir $port | head -1)
  cd $PORTSDIR/$dir
}

function poud_jails_delete () {

  for build in $_builds; do
    for arch in $_arches; do
      sudo poudriere jail -d -j $build$arch
    done
  done
}

function poud_jails_create () {

  for build in $_builds_tags; do
    tag=$(echo $build | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in $_arches; do
      sudo poudriere jail -c -j $build$arch -v $tag -a $arch
    done
  done
}

function poud_jails_update () {

  for build in $_builds; do
    for arch in $_arches; do
      sudo poudriere jail -u -j $build$arch
    done
  done
}

function poud_zfs_init () {

  sudo zpool create $_zpool /dev/xbd1
  sudo zfs set mountpoint=none $_zpool
  sudo zfs create $_zpool/poudriere
  sudo zfs create $_zpool/ccache
  sudo zfs set mountpoint=$poudriere_dir/ccache $_zpool/ccache
}

alias pi="poud_pi"
function poud_pi () {
  local field=$1
  local regex=$2
  local modifier=$3

  local pos=-1

  case $field in
    name)        pos=1;;
    dir)         pos=2;;
    prefix)      pos=3;;
    comment)     pos=4;;
    desc)        pos=5;;
    maintainer)  pos=6;;
    categories)  pos=7;;
    build)       pos=8;;
    run)         pos=9;;
    www)         pos=10;;
    extract)     pos=11;;
    patch)       pos=12;;
    fetch)       pos=13;;
  esac

  regex=$(echo $regex | sed -e 's,/,\\/,g')

  if [ $field = "deps" ]; then
    out=$(awk -F'|' "\$8 ~ /$regex/ || \$9 ~ /$regex/ || \$11 ~ /$regex/ || \$12 ~ /$regex/ || \$13 ~ /$regex/ { print \$2 }" $PORTSDIR/INDEX-11)
  else
    out=$(awk -F'|' "\$$pos ~ /$regex/ { print \$2 }" $PORTSDIR/INDEX-11)
  fi

  if [ "$modifier" = "M" ]; then
    echo $out |sed -e 's,/usr/ports/,,' -e 's,$,/Makefile,'
  elif [ "$modifier" = "P" ]; then
    echo $out |sed -e 's,/usr/ports/,,' -e 's,$,/pkg-plist,'
  elif [ "$modifier" = "D" ]; then
    echo $out |sed -e 's,/usr/ports/,,' -e 's,$,/pkg-descr,'
  else
    echo $out |sed -e 's,/usr/ports/,,'
  fi
}

function poud_ptree_init () {

  if [ -z $PORTSDIR -o -z $_pdir ]; then
      echo "must call `pdir foo` 1st"
      return
  fi

  git_repo=git@github.com:$USER/freebsd-ports.git
  git_svn_uri=svn.freebsd.org/ports
  svn_proto=svn+ssh

  zdir=$_zports/poudriere/ports/$_pdir

  sudo zfs destroy -fr $zdir
  sudo zfs create $zdir
  sudo zfs set mountpoint=$PORTSDIR $zdir

  sudo chown pgollucci:pgollucci $PORTSDIR
  git clone $git_repo $PORTSDIR

  cd $PORTSDIR
  sha=$(git rev-parse --short HEAD 2> /dev/null)
  sudo zfs snapshot $zdir@$sha-git-init

  git svn init -T head $svn_proto://$git_svn_uri .
  sudo zfs snapshot $zdir@$sha-svn-init

  sha=$(git rev-parse --short HEAD 2> /dev/null)
  cat <<EOF >> .git/config
[oh-my-zsh]
        hide-dirty = 1
[remote "origin"]
        fetch = +refs/pull/*:refs/remotes/origin/pull/*
EOF

  git update-ref refs/remotes/origin/trunk `git show-ref origin/svn_head | cut -d" " -f1`
  git svn fetch
  sudo zfs snapshot $zdir@$sha-svn-fetch

  git checkout trunk
  git branch -D master
  git checkout -b master trunk
  sudo zfs snapshot $zdir@$sha-svn-branches

  git svn rebase
  git remote add upstream git@github.com:freebsd/freebsd-ports.git
  sudo zfs snapshot $zdir@$sha-svn-rebase
}

function poud_ptree_sync () {

  if [ -z $PORTSDIR ]; then
      echo "must call `pdir foo` 1st"
      return
  fi

  cd $PORTSDIR

  br=$(git branch |grep -- \* |awk '{print $2}')

  git stash save prepsync

  if [ $br != "master" ]; then
      git checkout master
  fi

  sudo zfs snapshot $zdir@sync_before_origin_fetch
  git fetch origin

  sudo zfs snapshot $zdir@sync_before_upstream_fetch
  git fetch upstream

  sudo zfs snapshot $zdir@sync_before_upstream_fetch
  git merge upstream/svn_head
  sudo zfs snapshot $zdir@sync_after_upstream_fetch

  git push
  git svn rebase
  sudo zfs snapshot $zdir@sync_after_svn_rebase

  git checkout $br
  git stash pop
}

function poud_poudriere_sync () {

  cdpoudriere

  br=$(git branch |grep -- \* |awk '{print $2}')

  git stash save prepsync
  git checkout master
  git fetch origin
  git fetch upstream
  git merge upstream/master
  git push

  git checkout $br
  git stash pop
}

function poud_ci () {

  local pr=$1

  local d=/tmp/fbsd/$pr
  local n=$d/name
  local r=$d/reporter
  local m=$d/maintainer

  port=$(cat $n)
  reporter_email=$(cat $r)
  maintainer_email=$(cat $m)
  if [ $maintainer_email = $reporter_email ]; then
    maintainer=1
  else
    maintainer=0
  fi

  p1=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | head -1 | awk '{print $2}')
  p2=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | tail -1 | awk '{print $2}')

  if [ $p1 != $p2 ]; then
    update=1
  else
    update=0
  fi

  cif=$d/cif
  if [ $update ]; then
    echo "Update $port $p1 -> $p2" > $cif
  else
    echo $port ? $cif
  fi

  echo >> $cif

  echo "PR:\t\t\t$pr" >> $cif

  if [ $maintainer ]; then
    echo -e "Submitted by:\t$reporter_email (maintainer)" >> $cif
  else
    echo -e "Submitted by:\t$reporter_email" >> $cif
    echo -e "Approved by:\t$maintainer_email" >> $cif
  fi

  git add -A $PORTSDIR/$port
  git commit -F $cif
}

function poud_diff () {

  git diff `git svn dcommit -n | grep '^diff-tree'| cut -f 2,3 -d" "`
}

# ----------------------------------------------------------------------------
_pybugz_dir=$_rdir/pybugz
_pybugz=$_pybugz_dir/bin/bugz
PYTHONPATH=$_pybugz_dir:$PYTHONPATH; export PYTHONPATH

_bz=$_pybugz

function bzlogin () {
  $_bz login
}

function bztake () {
  local pr=$1

  $_bz modify -a $USER@freebsd.org -s Open -c "Take." $pr
}

function bzinprog () {
  local pr=$1

  $_bz modify -s 'In Progress' $pr
}

function bzmine () {
  local pr=$1

  bztake $pr
  bzinprog $pr
}

function bzpatch () {

  local pr=$1

  local d=/tmp/fbsd/$pr
  local i=$d/info
  local p=$d/patch
  local n=$d/name
  local r=$d/reporter
  local m=$d/maintainer

  mkdir -p $d
  $_bz get $pr > $d/info

  port=$(\grep Title $i | egrep -o "[_a-zA-Z0-9\-]*/[_a-zA-Z0-9\-]*")
  attachment=$(\grep -i Attachment $i | egrep 'patch|diff' | awk '{print $2}' | sed -e 's,\[,,' -e 's,\],,' | sort -n | tail -1)
  reporter=$(awk -F': ' '/Reporter/ { print $2}' $i)

  $_bz attachment -v $attachment > $p

  ( cd $PORTSDIR/$port ; patch -p5 < $p )
  find $PORTSDIR/$port -type f -a \( -name "*.rej" -o -name "*.orig" \) -print -exec rm -f "{}" \;
  ( cd $PORTSDIR/$port ; find . -empty | xargs git rm -f)
  ( cd $PORTSDIR/$port ; git add -A . )

  maintainer=$( cd $PORTSDIR/$port ; make -V MAINTAINER)

  echo $port > $n
  echo $reporter > $r
  echo $maintainer > $m
}

function bzclose () {
  local pr=$1

  $_bz modify -s 'Closed' -r FIXED -c 'Committed. Thanks!' $pr
}

function bzlist () {

 echo $_bz
}
