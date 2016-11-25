#!/bin/sh

install_envs() {

    echo "python:"
    pyenv install 2.7.12
    pyenv install 3.5.2

    echo "ruby:"
    rbenv install 2.2.5
    rbenv install 2.3.1
    rbenv install 2.4.0-preview2

    echo "plenv:"
    plenv install 5.22.2
    plenv install 5.24.0
    plenv install 5.25.5

    echo "goenv:"
    goenv install 1.5.4
    goenv install 1.6.3
    goenv install 1.7.2

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

    for lang in rbenv pyenv plenv goenv jenv; do
	local flag
	case $lang in
	    rbenv|pyenv) flag="-f" ;;
	    *) flag="" ;;
	esac

	local action
	case $lang in
	    jenv) action=remove;;
	    *) action=uninstall
	esac

	for ver in $($lang versions | awk '/\d/{print $1}'); do
	    $lang $action $flag $ver
	done
    done
}

action="$1"

case $action in
    install) install_envs ;;
    uninstall) uninstall_envs ;;
esac
