#!/bin/sh

install_envs() {

    echo "python:"
    pyenv install 2.7.14
    pyenv install 3.6.3
    pyenv install 3.7-dev

    echo "ruby:"
    rbenv install 2.4.2
    rbenv install 2.5.0-dev

    echo "plenv:"
    plenv install 5.26.1
    plenv install 5.27.6

    echo "goenv:"
    goenv install 1.8.3
    goenv install 1.9

    echo "java:"
    brew cask install java
    brew cask install java9-beta

    echo "R:"
    Renv install 3.4.0

    echo "Scala:"
    scalaenv install scala-2.12.3

    echo "Lua"
    luaenv install 5.3.3

    (
	cd /Library/Java/JavaVirtualMachines
	for d in $(ls -d *); do
	    jenv add /Library/Java/JavaVirtualMachines/$d/Contents/Home
	done
    )

    pyenv global 3.6.2
    rbenv global 2.4.1
    plenv global 5.26.0
    goenv global 1.8.3
    jenv global 1.8.0.74
    Renv global 3.4.0
    scalaenv global scala-2.12.3
    luaenv global 5.3.3
}

uninstall_envs() {

    local lang
    local ver

    for lang in luaenv; do
	local flag_f
	case $lang in
	    rbenv|pyenv|plenv|luaenv) flag_f="-f" ;;
	    *) flag_f="" ;;
	esac

	local flag_bare
	case $lang in
	    rbenv|pyenv|plenv|luaenv|scalaenv) flag_bare="--bare" ;;
	    *) flag_bare="" ;;
	esac

	local action
	case $lang in
	    jenv) action=remove;;
	    *) action=uninstall
	esac

	for ver in $($lang versions $flag_bare | awk '/[0-9]/{print $1}' | grep -v '^\*$'); do
	    case $lang in
		scalaenv)
		    # XXX: no remove/uninstall
		    rm -f $HOME/.repos/langs/$lang/version
		    rm -rf $HOME/.repos/langs/$lang/versions/$ver
		    ;;
		*)
		    [ x"$ver" = x"*" ] && continue
		    $lang $action $flag_f $ver
		    rm -f $HOME/.repos/langs/$lang/version
		    ;;
	    esac
	done
    done
}

action="$1"

case $action in
    install) install_envs ;;
    uninstall) uninstall_envs ;;
esac
