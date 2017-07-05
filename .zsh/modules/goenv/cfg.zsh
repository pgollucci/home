__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export GOENV_ROOT=$HOME/.repos/langs/goenv
    path_if $GOENV_ROOT/bin

    if [ -x $GOENV_ROOT/bin/goenv ]; then
      export HAS_GOENV=1
      eval "$(goenv init - )"
    fi
}

goenv_prompt_line() {

    local v_string=$(goenv_version)
    echo "${magenta}go:$v_string${norm}"
}

goenv_version() {

    env_version "go"
}

goev() {

    eval `goenv shell $1`
}


__setup
