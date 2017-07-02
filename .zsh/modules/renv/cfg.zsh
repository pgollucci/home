__setup() {

    export RENV_ROOT=$HOME/.repos/langs/Renv
    path_if $RENV_ROOT/bin

    if [ -x $RENV_ROOT/bin/Renv ]; then
	export HAS_RENV=1
	eval "$(Renv init - zsh)"
    fi
}

Renv_prompt_line() {

    echo "${magenta}Renv: [$(Renv_version)]${norm}"
}

Renv_version() {

    if [ $HAS_RENV ]; then
	local ver=$(Renv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "sys:$(R --version | head -1 |awk '{print $3}')"
	fi
    else
	echo "sys:$(R --version | head -1 |awk '{print $3}')"
    fi
}

__setup
