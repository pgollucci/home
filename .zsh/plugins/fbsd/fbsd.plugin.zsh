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

function _poud_transliterate_port () {
  local port=$1

  echo $port |sed -e 's,[/ ],_,g'
}

function _poud_from_dir_or_arg () {
  local port=$1

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  echo $port
}

function poud_packages () {

  if [ `id -u` != 0 ]; then
    echo "need to be root"
    return
  fi

  pkg delete -af -y
  pkg bootstrap -y
  pkg install -y \
      automake bash-static dialog4ports emacs-nox11 git-subversion \
      hub libtool portlint python34 ruby21-gems rsync sudo swaks \
      tmux vim-lite zsh
}

function poud_zfs_init () {

  sudo zpool create $_zpool /dev/xbd1
  sudo zfs set mountpoint=none $_zpool
  sudo zfs create $_zpool/poudriere
  sudo zfs create $_zpool/ccache
  sudo zfs set mountpoint=$poudriere_dir/ccache $_zpool/ccache
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

  sudo chown $USER:$USER $PORTSDIR
  git clone $git_repo $PORTSDIR

  cd $PORTSDIR
  git svn init -T head $svn_proto://$git_svn_uri .

    cat <<EOF
EOF >> .git/config
[oh-my-zsh]
        hide-dirty = 1
[remote "origin"]
        fetch = +refs/pull/*:refs/remotes/origin/pull/*
EOF

    git update-ref refs/remotes/origin/trunk `git show-ref origin/svn_head | cut -d" " -f1`
    git svn fetch

    git checkout trunk
    git branch -D master
    git checkout -b master trunk

    git svn rebase
    git remote add upstream git@github.com:freebsd/freebsd-ports.git
    git branch --set-upstream-to=origin/master master
}

function poud_ptree () {
  local tree=$1

  [ -n "$tree" ] && \
      PORTSDIR=$_poudriere_ports/$tree && export PORTSDIR && \
      _pdir=$tree && export _pdir

  echo $PORTSDIR
}

function poud_mfi () {

  cd $PORTSDIR ; make fetchindex
}

alias ip="poud_pi"
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

  index_file=$PORTSDIR/INDEX-11

  if [ $field = "deps" ]; then
      out=$(awk -F'|' "\$8 ~ /$regex/ || \$9 ~ /$regex/ || \$11 ~ /$regex/ || \$12 ~ /$regex/ || \$13 ~ /$regex/ { print \$2 }" $index_file)
  else
    out=$(awk -F'|' "\$$pos ~ /$regex/ { print \$2 }" $index_file)
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

function poud_go () {
  local port=$1

  dir=$(poud_pi dir $port | head -1)
  cd $PORTSDIR/$dir
}

function poud_uses () {
  local str=$1
  local pattern=${2:-USE}

  (cd $PORTSDIR ; poud_pi deps $str M | xargs grep $pattern |grep $str)
}

function poud_build_changed () {
  local build=$1

  mports=$(cd $PORTSDIR ; git status | grep : | awk -F: '/\// { print $2 }' | cut -d / -f 1,2 | sed -e 's, ,,g' | sort -u | xargs)
  nports=$(cd $PORTSDIR ; git status | grep "/$" | sed -e 's, ,,g' -e 's,/$,,' -e 's,^ *,,' | xargs)

  tports=$(_poud_transliterate_port "$mports $nports")

  tmux new -s $build "sudo poudriere bulk -t -B $tports-$(date "+%Y%m%d_%H%M") -j ${build} -C $nports $mports"
}

function poud_build_port () {
  local build=$1
  local port=$(_poud_from_dir_or_arg $port)

  tport=$(_poud_transliterate_port $port)
  tmux new -s $build "sudo poudriere bulk -t -B ${tport}-$(date "+%Y%m%d_%H%M") -j ${build} -I -C $port"
}

function poud_test_port () {
  local build=$1
  local port=$(_poud_from_dir_or_arg $port)

  sudo poudriere testport -j $build -o $port -I
  sudo jexec ${build}-default-n env -i TERM=$TERM /usr/bin/login -fp root
}

function poud_build_all () {
  local build=$1

  tmux new -s $build "sudo poudriere bulk -t -B all -j ${build} -a"
}

function poud_builds_nuke () {

  sudo find /usr/local/poudriere/data -type d -a \( -name "*i386*" -o -name "*amd64*" \) |grep -v cache |xargs sudo rm -rf
  sudo rm -rf $_poudriere_data/logs/bulk/.data.json
}

function poud_diff () {

  git diff `git svn dcommit -n | grep '^diff-tree'| cut -f 2,3 -d" "`
}

function poud_ci () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local cif=$d/msg

  local title="$(cat $d/title)"
  local port=$(cat $d/port)
  local reporter=$(cat $d/reporter)
  local maintainer=$(cat $d/maintainer)
  local is_maintainer=$(_bz_is_maintainer $reporter $maintainer)
  local days=$(_bz_time_from_pr $pr)
  local update="$(cat $d/update)"

  local submitted_by=""
  local approved_by=""
  if [ $is_maintainer -eq 1 ]; then
    submitted_by="$reporter (maintainer)"
  else
    submitted_by="$reporter"
    if [ -n $days ]; then
      approved_by="maintainer timeout ($maintainer ; $days days)"
    else
      approved_by="$maintainer (maintainer)"
    fi
  fi

  cat <<EOF > $cif
$title

-

PR:                  $pr
Submitted by:        $submitted_by
Approved by:         $approved_by
EOF

  ( cd $PORTSDIR/$port ; git add -A .)
  ( cd $PORTSDIR/$port ; git commit -F $cif)
}

# ----------------------------------------------------------------------------
_pybugz_dir=$_rdir/pybugz
_pybugz=$_pybugz_dir/bin/bugz
PYTHONPATH=$_pybugz_dir:$PYTHONPATH; export PYTHONPATH

_bz=$_pybugz

function _bz_pr_dir () {
  local pr=$1

  local d=/tmp/fbsd/$pr
  if [ ! -d $d ]; then
    mkdir -p $d
  fi

  echo $d
}

function _bz_get_attachment () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local id=0

  local a_cnt=$(grep Attachments $d/info | cut -d: -f2 | sed -e 's, ,,g')
  if [ $a_cnt -gt 0 ]; then
    local id=$(grep "\[Attachment\]" $d/info | egrep -i 'shar|diff|patch' | sed -e 's,\[,,' -e 's,\],,' | sort -n | tail -1 )
    fetch -q -o $d/patch "https://bz-attachments.freebsd.org/attachment.cgi?id=$id"
    local s_cnt=$(head -1 $d/patch | grep -c "# This is a shell archive.")
    if [ $s_cnt -eq 1 ]; then
        echo "1" > $d/shar
    fi
  else
    echo "0" > $d/shar
  fi
}

function _bz_is_timeout () {
  local created=$1

  local ethen=$(date -j -f "%Y%m%d" "$created" "+%s")
  local enow=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s")
  local days=$(printf "%.0f" $(echo "scale=2; ($enow - $ethen)/(60*60*24)" | bc))

  echo $days
}

function _bz_timeout_from_pr () {
  set -x
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local str="$(grep "Maintainer Timeout -" $d/info | awk -F'-' '{ print $2 }' | sed -e 's,^ *,,')"

  echo $str
}

function _bz_is_maintainer () {
  local reporter=$1
  local maintainer=$2

  if [ $reporter = $maintainer ]; then
    is_maintainer=1
  else
    is_maintainer=0
  fi

  echo $is_maintainer
}

function _bz_is_update () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)

  p1=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | head -1 | awk '{print $2}')
  p2=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | tail -1 | awk '{print $2}')

  if [ $p1 != $p2 ]; then
    echo "$p1 -> $p2" > $d/update
  else
    touch $d/update
  fi
}

function _bz_get_maintainer () {
  local port=$1

  if [ -d $PORTSDIR/$port ]; then
   echo $(cd $PORTSDIR/$port ; make -V MAINTAINER)
  fi
}

function _bzget () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  $_bz get $pr > $d/info

  local title="$(grep Title $d/info |cut -d: -f 2- |sed -e 's,^ *,,')"
  local port=$(echo $title| egrep -o "[_a-zA-Z0-9\-]*/[_a-zA-Z0-9\-]*" | head -1)
  local reporter=$(awk -F': ' '/Reporter/ { print $2 }' $d/info)
  local created=$(awk -F': '  '/Reported/ { print $2 }' $d/info | sed -e 's,T.*,,')
  local maintainer=$(_bz_get_maintainer $port)
  local days=$(_bz_is_timeout $created)
  _bz_get_attachment $pr

  echo $title         > $d/title
  echo $port          > $d/port
  echo $reporter      > $d/reporter
  echo $created       > $d/created
  echo $maintainer    > $d/maintainer

  if [ -n $days -a $days -gt 14 ]; then
    echo $days > $d/days
  else
    touch $d/days
  fi
}

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

  _bzget $pr
}

function bzmine () {
  local pr=$1

  bztake $pr
  bzinprog $pr
}

function bztimeout () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local days=$(cat $d/days)
  local maintainer=$(cat $d/maintainer)

  if [ -n "$days" ]; then
    $_bz modify -c "Maintainer Timeout - $days days ($maintainer)" $pr
  fi

  _bzget $pr
}

function bzpatch () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local is_shar=$(cat $d/shar)

  if [ -e $d/patch ]; then
    if [ $is_shar -eq 1 ]; then
      _bzpatch_shar $pr
    else
      _bzpatch_patch $pr
    fi
  fi
}

function _bzpatch_patch () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)
  local l=$(grep ^Index: $d/patch | head -1 | awk '{ print gsub(/\//,"") }')

  ( cd $PORTSDIR/$port ; patch -p$l < $d/patch )
  find $PORTSDIR/$port -type f -a \( -name "*.rej" -o -name "*.orig" \) -print -exec rm -f "{}" \;
  ( cd $PORTSDIR/$port ; find . -type f -empty | xargs git rm -rf)
  _bz_is_update $pr
}

function _bzpatch_shar () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)

  local l=$(grep /Makefile $d/patch | head -1 | awk '{ print gsub(/\//,"") }')
  if [ $l -eq 1 ]; then
    local category=$(awk '/^XCATEGORIES=/ { print $2 }' $d/patch)
    mkdir -p $d/tmp
    (cd $d/tmp ; sh $d/patch)
    mv $d/tmp/* $PORTSDIR/$category
  else
    sed -i'' -e 's,/usr/ports/,,' $d/patch
    (cd $PORTSDIR ; sh $d/patch)
  fi
}

function bzoverto () {
  local pr=$1
  local owner=$2
  local reason=$3

  $_bz modify -a $owner@FreeBSD.org -c "Over to $owner $reason" -s Open $pr
}

function bzclose () {
  local pr=$1

  $_bz modify -s 'Closed' -r FIXED $pr

  local d=$(_bz_pr_dir $pr)
  rm -rf $d
}

function bztop () {

 $_bz --encoding=utf8 search -s New --product "Ports & Packages" | awk '{print $3}' | sort | uniq -c | sort -nr -k 1,1 | head $1
}

function bzlist () {
  local str="$1"

  $_bz --encoding=utf8 search --product "Ports & Packages" "$*"
}
