__setup() {

    alias emacs='emacsclient --alternate-editor "" --create-frame'
}

emacs_wrapper() {

  local x=`emacsclient --alternate-editor '' --eval '(x-display-list)' 2>/dev/null`

  if [ -z "$x" -o "$x" = "nil" ]; then
      # Create one if there is no X window yet.
      emacsclient --alternate-editor "" --create-frame "$@"
  else
      # prevent creating another X frame if there is at least one present.
      emacsclient --alternate-editor "" "$@"
  fi
}

__setup
