__setup() {

    alias emacs=emacs_wrapper
}

emacs_wrapper() {

  /usr/local/bin/emacsclient --alternate-editor '' --create-frame "$@"
}

__setup
