function pdir () {
  [ -n "$1" ] && PORTSDIR=/usr/local/poudriere/ports/$1 && export PORTSDIR
  echo $PORTSDIR
}

function mfi () {
  cd $PORTSDIR ; make fetchindex
}

function nbuilds () {
  sudo find /usr/local/poudriere/data \( -name "*i386*" -o -name "*amd64*" \) | xargs sudo rm -rf 
  sudo rm -rf /usr/local/poudriere/data/logs/bulk/.data.json
}

function pbuild () {
  local port=$1
  local build=110amd64

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  tmux new -s $build "sudo poudriere bulk -t -B ${build}-default -j ${build} $port"
}

function pbulk () {
  local port=$1

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  builds=$(poudriere jail -l -n -q)  
  for build in `echo $builds`; do
    sudo poudriere bulk -t -B ${build}-default-$(echo $port |sed -e 's,/,_,g') -j ${build} $port &
  done
}

function pbb () {
    local build=$1
    tmux new -s $build "sudo poudriere bulk -t -B ${build}-default -j ${build} -a"
}

function pg () {
  local port=$1

  dir=$(ip dir $port |head -1)

  cd $PORTSDIR/$dir
}

function pijails () {
  sudo poudriere jail -d -j 84i386
  sudo poudriere jail -d -j 84amd64
  sudo poudriere jail -d -j 93i386
  sudo poudriere jail -d -j 93amd64
  sudo poudriere jail -d -j 101i386
  sudo poudriere jail -d -j 101amd64
  sudo poudriere jail -d -j 110amd64
  sudo poudriere jail -d -j 110i386

  sudo poudriere jail -c -j 84i386   -v 8.4-RELEASE  -a i386 -m http
  sudo poudriere jail -c -j 84amd64  -v 8.4-RELEASE  -a amd64 -m http
  sudo poudriere jail -c -j 93i386   -v 9.3-RELEASE  -a i386 -m http
  sudo poudriere jail -c -j 93amd64  -v 9.3-RELEASE  -a amd64 -m http
  sudo poudriere jail -c -j 101i386  -v 10.1-RELEASE -a i386 -m http
  sudo poudriere jail -c -j 101amd64 -v 10.1-RELEASE -a amd64 -m http
  sudo poudriere jail -c -j 110amd64 -v 11.0-CURRENT -a amd64 -m http
  sudo poudriere jail -c -j 110i386  -v 11.0-CURRENT -a i386 -m http
}

function pujails () {
  sudo poudriere jail -u -j 84i386
  sudo poudriere jail -u -j 84amd64
  sudo poudriere jail -u -j 93i386
  sudo poudriere jail -u -j 93amd64
  sudo poudriere jail -u -j 101i386
  sudo poudriere jail -u -j 101amd64
  sudo poudriere jail -u -j 110amd64
  sudo poudriere jail -u -j 110i386
}

function pzwork () {
  sudo zpool create zwork /dev/xbd1
  sudo zfs set mountpoint=none zwork
  sudo zfs create zwork/poudriere
  sudo zfs create zwork/ccache
  sudo zfs set mountpoint=/usr/local/poudriere/ccache zwork/ccache
}

function ip () {
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

function psync () {
  cd $PORTSDIR

  br=$(git branch |grep -- \* |awk '{print $2}')

  git stash save prepsync
  git checkout master
  git fetch origin
  git fetch upstream
  git merge upstream/svn_head
  git push
  git svn rebase

  git checkout $br
  git stash pop
}

function poudriere_sync () {
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

function pnuke () {
  sudo rm -rf /usr/local/poudriere/data
}

alias cdfb='cd $HOME/fbsd/bin'
alias cdpdir='cd $PORTSDIR'

_rdir=$HOME/repos/fbsd
if [ -d $_rdir ]; then
  for d in `cd $_rdir ; /bin/ls -1d *`; do
    alias cd$d="cd $_rdir/$d"
  done
fi
unset _rdir
