function pdir () {
  [ -n "$1" ] && PORTSDIR=/usr/local/poudriere/ports/$1 && export PORTSDIR
  echo $PORTSDIR
}

function fi () {
  cd $PORTSDIR ; make fetchindex
}

function pjails () {
  sudo poudriere jail -d -j 101i386
  sudo poudriere jail -d -j 101amd64
  sudo poudriere jail -d -j 110amd64
  sudo poudriere jail -d -j 110i386

  sudo poudriere jail -c -j 101i386  -v 10.1-RELEASE -a i386
  sudo poudriere jail -c -j 101amd64 -v 10.1-STABLE  -a amd64
  sudo poudriere jail -c -j 110amd64 -v 11.0-CURRENT -a amd64
  sudo poudriere jail -c -j 110i386  -v 11.0-CURRENT -a i386
}

function pzwork () {
  sudo zpool create zwork /dev/xbd1
  sudo zfs set mountpoint=none zwork
  sudo zfs create zwork/poudriere
  sudo zfs create zwork/ccache
  sudo zfs set mountpoint=/usr/local/poudriere/ccache zwork/ccache
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
