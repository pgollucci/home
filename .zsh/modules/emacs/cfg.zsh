__setup() {

    alias emacs=emacs_wrapper
    alias ek="ps -efwww | awk '/[E]macs/ { print \$2 }'| xargs kill -9"
}

emacs_wrapper() {

  /usr/local/bin/emacsclient --alternate-editor '' --create-frame "$@"
}

__setup
