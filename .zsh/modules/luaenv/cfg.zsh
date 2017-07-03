__setup() {

    export LUAENV_ROOT=$HOME/.repos/langs/luaenv
    path_if $LUAENV_ROOT/bin

    if [ -x $LUAENV_ROOT/bin/luaenv ]; then
	export HAS_LUAENV=1
	eval "$(luaenv init - zsh)"
    fi
}

luaenv_prompt_line() {

    echo "${magenta}lua:$(luaenv_version)${norm}"
}

luaenv_version() {

    if [ $HAS_LUAENV ]; then
	local ver=$(luaenv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "sys:$(ruby -v 2>&1 | cut -f 2 -d ' ')"
	fi
    else
	echo "sys:$(ruby -v 2>&1 | cut -f 2 -d ' ')"
    fi
}

__setup
