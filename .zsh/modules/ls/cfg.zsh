__setup() {

    export LSCOLORS=Gxfxcxdxbxegedabagacad
    case "$OSTYPE" in
        freebsd*|darwin*) alias ll='ls -alFGTh' ;;
                       *) alias ll='/bin/ls -alFh --color=auto' ;;
    esac

}

__setup
