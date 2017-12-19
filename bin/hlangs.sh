#!/bin/sh

install_envs() {

    echo "python:"
    pyenv install $py_ver_old
    pyenv install $py_ver
    pyenv install $py_ver_dev

    echo "ruby:"
    rbenv install $rb_ver
    rbenv install $rb_ver_dev

    echo "plenv:"
    plenv install $pl_ver
    plenv install $pl_ver_dev

    echo "goenv:"
    goenv install $go_ver
    goenv install $go_ver_dev

    echo "java:"
    brew cask install $java_ver
    brew cask install $java_ver_dev

    echo "R:"
    Renv install $R_ver

    echo "Scala:"
    scalaenv install $scala_ver

    echo "Lua"
    luaenv install $lua_ver

    (
	cd /Library/Java/JavaVirtualMachines
	for d in $(ls -d *); do
	    jenv add /Library/Java/JavaVirtualMachines/$d/Contents/Home
	done
    )

    pyenv global $py_ver
    rbenv global $rb_ver
    plenv global $pl_ver
    goenv global $go_ver
    jenv global $java_ver
    Renv global $R_ver
    scalaenv global $scala_ver
    luaenv global $lua_ver
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

main() {
    local action="$1"

    . bin/.hvers

    case $action in
	install) install_envs ;;
	uninstall) uninstall_envs ;;
    esac
}

main "$@"
exit $?
