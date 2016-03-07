pdir () {
  eval `poud pdir $1`
}

pbuild () {
  eval `poud bname $1`
}

alias ip="poud ip"
alias cdpdir='cd $PORTSDIR'
