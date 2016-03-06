alias irc_attach='tmux attach -t irc'
alias irc_init='tmux new -s irc irssi'
irc () {
  if ! irc_attach ; then
    irc_init
  fi
}
