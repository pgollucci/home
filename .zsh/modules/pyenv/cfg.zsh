__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export PYENV_ROOT=$P6_SRC_GH_DIR/pyenv
    path_if $PYENV_ROOT/bin

    if [ -x $PYENV_ROOT/bin/pyenv ]; then
      export HAS_PYENV=1
      eval "$(pyenv init - zsh)"
      eval "$(pyenv virtualenv-init - zsh)"
    fi
}

pyenv_prompt_line() {

    echo "${magenta}py:$(pyenv_version)${norm}"
}

pyenv_version() {

    env_version "py"
}

__setup
