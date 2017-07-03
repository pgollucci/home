__setup() {

    [ -n "DISALBLE_ENVS" ] && return

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

    if [ $HAS_GOENV ]; then
	if [ -n "$GOENV_VERSION" ]; then
	    echo "$GOENV_VERSION"
	else
	    local ver=$(goenv version 2>/dev/null)
	    echo "$ver"
	fi
    else
	echo "sys:$(go version |awk '{print $3}' |sed -e 's,go,,')"
    fi
}

goev() {

    eval `goenv shell $1`
}


__setup
