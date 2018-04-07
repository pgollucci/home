__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export JENV_ROOT=$P6_SRC_GH_DIR/jenv
    path_if $JENV_ROOT/bin

    if [ -x $JENV_ROOT/bin/jenv ]; then
	export HAS_JENV=1
	eval "$(jenv init - )"
    fi
}

jenv_prompt_line() {

    echo "${magenta}j:$(jenv_version)${norm}"
}

jenv_version() {

    env_version "j"
}


__setup
