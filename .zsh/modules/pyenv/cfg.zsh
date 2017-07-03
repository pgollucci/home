__setup() {

    [ -n "DISALBLE_ENVS" ] && return

    export VIRTUAL_ENV_DISABLE_PROMPT=1

    export PYENV_ROOT=$HOME/.repos/langs/pyenv
    path_if $PYENV_ROOT/bin

    if [ -x $PYENV_ROOT/bin/pyenv ]; then
      export HAS_PYENV=1
      eval "$(pyenv init - zsh)"
    fi

    if [ -e $HOME/.repos/langs/pyenv/venvs/home/bin/activate ]; then
	. $HOME/.repos/langs/pyenv/venvs/home/bin/activate
    fi
}

pyenv_prompt_line() {

    echo "${magenta}py:$(pyenv_version)$(virtualenv_name)${norm}"
}

virtualenv_name() {

    if [ -n "$VIRTUAL_ENV" ]; then
	echo "($(basename $VIRTUAL_ENV))"
    fi
}

pyenv_version() {

    if [ $HAS_PYENV ]; then
	local ver=$(pyenv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "sys:$(python -V 2>&1 | cut -f 2 -d ' ')"
	fi
    else
	echo "sys:$(python -V 2>&1 | cut -f 2 -d ' ')"
    fi
}

__setup
