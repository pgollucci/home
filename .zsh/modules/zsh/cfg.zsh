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

zoff() {

    rm -f ~/.zshrc*
    exec $SHELL -l
}

zon() {

    (cd ~ ; git checkout .zshrc)
}

__setup() {

  alias ae="$EDITOR ~/.zsh/modules/aws/lib/perl5/P6/AWS/SGen.pm"
  alias pe="$EDITOR ~/.zsh/modules/_util/lib/perl5/P6/Util.pm"
  alias ee="$EDITOR ~/.emacs.d/init.el"
  alias ze="$EDITOR ~/.zshrc"

  load_file "${___dir}/colors.zsh"
  load_file "${___dir}/history.zsh"
  load_file "${___dir}/sudo.zsh"
}

__setup
