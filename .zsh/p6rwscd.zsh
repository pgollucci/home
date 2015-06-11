_rdir=$HOME/repos/rws

if [ -d $_rdir ]; then
  for d in `cd $_rdir ; /bin/ls -1d *`; do
    eval "alias cd$d='cd $_rdir/$d'"
  done
fi

unset _rdir
