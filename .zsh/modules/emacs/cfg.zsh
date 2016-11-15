__setup() {

    alias emacs=emacs_wrapper
    alias ek="kill -9 `ps -efwww | awk '/[E]macs/ { print $2 }'`"
}

emacs_wrapper() {

  /usr/local/bin/emacsclient --alternate-editor '' --create-frame "$@"
}

__setup
