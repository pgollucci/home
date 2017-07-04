__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export SCALAENV_ROOT=$HOME/.repos/langs/scala
    path_if $SCALAENV_ROOT/bin

    if [ -x $SCALAENV_ROOT/bin/scalaenv ]; then
	export HAS_SCALAENV=1
	eval "$(scalaenv init - zsh)"
    fi
}

scalaenv_prompt_line() {

    echo "${magenta}scala:$(scalaenv_version)${norm}"
}

scalaenv_version() {

    if [ $HAS_SCALAENV ]; then
	local ver=$(scalaenv version-name |sed -e 's,scala-,,')
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo
	fi
    fi
}

__setup
