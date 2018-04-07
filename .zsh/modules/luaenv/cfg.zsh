__setup() {

    [ -n "$DISABLE_ENVS" ] && return

    export LUAENV_ROOT=$P6_SRC_GH_DIR/luaenv
    path_if $LUAENV_ROOT/bin

    if [ -x $LUAENV_ROOT/bin/luaenv ]; then
	export HAS_LUAENV=1
	eval "$(luaenv init - zsh)"
    fi
}

luaenv_prompt_line() {

    echo "${magenta}lua:$(luaenv_version)${norm}"
}

luaenv_version() {

    env_version "lua"
}

__setup
