#!/bin/sh

install_envs() {

    echo "python:"
    pyenv install 2.7.13
    pyenv install 3.5.3
    pyenv install 3.6.0

    echo "ruby:"
    rbenv install 2.2.7
    rbenv install 2.3.4
    rbenv install 2.4.1
    rbenv install 2.5.0-dev

    echo "plenv:"
    plenv install 5.22.3
    plenv install 5.24.1
    plenv install 5.25.9

    echo "goenv:"
    goenv install 1.6.4
    goenv install 1.7.4

    echo "java:"
    brew cask install java6
    brew cask install java7
    brew cask install java
    brew cask install jav9-beta

    (
	cd /Library/Java/JavaVirtualMachines
	for d in $(ls -d *); do
	    jenv add /Library/Java/JavaVirtualMachines/$d/Contents/Home
	done
    )

    rbenv global 2.2.5
    pyenv global 3.5.2
    plenv global 5.24.0
    goenv global 1.7.2
    jenv global 1.9-ea
}

uninstall_envs() {

    local lang
    local ver

    for lang in jenv; do
	local flag_f
	case $lang in
	    rbenv|pyenv) flag_f="-f" ;;
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
