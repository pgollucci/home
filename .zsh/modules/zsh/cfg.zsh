zshr() {
  local cache=$ZDOTDIR/.zcache
  autoload -U zrecompile
  autoload -Uz compinit && compinit -C -d ~/.zcompdump

  local f
  for f in ~/.zshrc "$cache/zcomp-$HOST"; do
    if [ -r $f ]; then
      zrecompile -p $f && command rm -f $f.zwc.old
    fi
  done

  exec $SHELL -l
}

__setup() {

  alias zshe="$EDITOR ~/.zshrc"
  alias ee="$EDITOR ~/.emacs.d/init.el"

  load_file "${___dir}/colors.zsh"
  load_file "${___dir}/history.zsh"
  load_file "${___dir}/sudo.zsh"
}

__setup
