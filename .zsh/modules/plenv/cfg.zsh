__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export PLENV_ROOT=$P6_SRC_GH_DIR/plenv
    path_if $PLENV_ROOT/bin

    if [ -x $PLENV_ROOT/bin/plenv ]; then
      export HAS_PLENV=1
      eval "$(plenv init - zsh)"
    fi
}

plenv_prompt_line() {

    echo "${magenta}pl:$(plenv_version)${norm}"
}

plenv_version() {

    env_version "pl"
}

__setup
