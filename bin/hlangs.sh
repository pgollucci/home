#!/bin/sh

install_envs() {

    echo "python:"
    pyenv install 2.7.13
    pyenv install 3.6.1
    pyenv install 3.7-dev

    echo "ruby:"
    rbenv install 2.4.1
    rbenv install 2.5.0-dev

    echo "plenv:"
    plenv install 5.26.0
    plenv install 5.27.1

    echo "goenv:"
    goenv install 1.7.6
    goenv install 1.8.3

    echo "java:"
    brew cask install java6
#    brew cask install java7
    brew cask install java
#    brew cask install java9-beta

    echo "R:"
    Renv install 3.4.0

    echo "Scala:"
    scalaenv install scala-2.12.2

    echo "Lua"
    luaenv install 5.3.3

    (
	cd /Library/Java/JavaVirtualMachines
	for d in $(ls -d *); do
	    jenv add /Library/Java/JavaVirtualMachines/$d/Contents/Home
	done
    )

    pyenv global 3.6.1
    rbenv global 2.4.1
    plenv global 5.26.0
    goenv global 1.8.3
    jenv global 1.8.0.74
    Renv global 3.4.0
    scalaenv global scala-2.12.2
    luaenv global 5.3.3
}

uninstall_envs() {

    local lang
    local ver

    for lang in pyenv rbenv goenv plenv jenv Renv scalaenv luaenv; do
	local flag_f
	case $lang in
	    rbenv|pyenv|plenv) flag_f="-f" ;;
	    *) flag_f="" ;;
	esac

	local flag_bare
	case $lang in
	    rbenv|pyenv|plenv) flag_bare="--bare" ;;
	    *) flag_bare="" ;;
	esac

	local action
	case $lang in
	    jenv) action=remove;;
	    *) action=uninstall
	esac

	for ver in $($lang versions $flag_bare | awk '/[0-9]/{print $1}' | grep -v '^\*$'); do
	    [ x"$ver" = x"*" ] && continue
	    $lang $action $flag_f $ver
	    rm -f $HOME/.repos/langs/$lang/version
	done
    done
}

action="$1"

case $action in
    install) install_envs ;;
    uninstall) uninstall_envs ;;
esac
