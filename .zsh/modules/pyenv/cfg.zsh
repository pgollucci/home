__setup() {

    export PYENV_ROOT=$HOME/.repos/langs/pyenv
    export PATH=$PYENV_ROOT/bin:$PATH

    if [ -x $PYENV_ROOT/bin/pyenv ]; then
      export HAS_PYENV=1
      eval "$(pyenv init - zsh)"
    fi
}

pyenv_prompt_info() {
    echo "pyenv: [$(pyenv_version)]"
}

pyenv_version() {

    if [ $HAS_PYENV ]; then
	pyenv version-name
    else
	echo "system:$(python -V 2>&1 | cut -f 2 -d ' ')"
    fi
}

__setup
