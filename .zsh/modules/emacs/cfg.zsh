__setup() {

    alias emacs=emacs_wrapper
    alias ek="ps -efwww | awk '/[E]macs/ { print \$2 }'| xargs kill -9"
}

emacs_wrapper() {

    local pid=$(ps -ef |grep "[E]macs-" | awk '{print $2}')
    if [ -z "${pid}" ]; then
        /Applications/Emacs.app/Contents/MacOS/Emacs --daemon "$@" &
    else
        /Applications/Emacs.app/Contents/MacOS/bin/emacsclient --alternate-editor '' --create-frame "$@"
    fi
}

__setup
