__setup() {

  alias zshr="exec $SHELL -l"
  alias zshe="$EDITOR ~/.zshrc"

  . ${___dir}/colors.zsh
  . ${___dir}/history.zsh
  . ${___dir}/sudo.zsh
}

__setup
