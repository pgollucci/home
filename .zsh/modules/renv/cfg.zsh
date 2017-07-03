__setup() {

    [ -n "DISALBLE_ENVS" ] && return

    export RENV_ROOT=$HOME/.repos/langs/Renv
    path_if $RENV_ROOT/bin

    if [ -x $RENV_ROOT/bin/Renv ]; then
	export HAS_RENV=1
	eval "$(Renv init - zsh)"
    fi
}

Renv_prompt_line() {

    echo "${magenta}R:$(Renv_version)${norm}"
}

Renv_version() {

    if [ $HAS_RENV ]; then
	local ver=$(Renv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "sys:"
	fi
    else
	echo "sys:"
    fi
}

__setup
