__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export RBENV_ROOT=$HOME/.repos/langs/rbenv
    path_if $RBENV_ROOT/bin

    if [ -x $RBENV_ROOT/bin/rbenv ]; then
	export HAS_RBENV=1
	eval "$(rbenv init - zsh)"
    fi
}

rbenv_prompt_line() {

    echo "${magenta}rb:$(rbenv_version)${norm}"
}

rbenv_version() {

    env_version "rb"
}

__setup
