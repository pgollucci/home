__setup() {

    alias emacs=emacs_wrapper
}

emacs_wrapper() {

  if [ -z "$EMACS_X" -o "$EMACS_X" = "nil" ]; then
      # Create one if there is no X window yet.
      local x=`emacsclient --alternate-editor '' --eval '(x-display-list)' 2>/dev/null`
      export EMACS_X=$x
      emacsclient --alternate-editor "" --create-frame "$@"
  else
      # prevent creating another X frame if there is at least one present.
      emacsclient --alternate-editor "" "$@"
  fi
}

__setup
