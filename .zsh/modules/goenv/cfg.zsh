__setup() {

    export GOENV_ROOT=$HOME/.repos/langs/goenv
    path_if $GOENV_ROOT/bin

    if [ -x $GOENV_ROOT/bin/goenv ]; then
      export HAS_GOENV=1
      eval "$(goenv init - )"
    fi
}

goenv_prompt_line() {

    echo "${magenta}goenv: [$(goenv_version)]${norm}"
}

goenv_version() {

    if [ $HAS_GOENV ]; then
	if [ -n "$GOENV_VERSION" ]; then
	    echo "$GOENV_VERSION"
	else
	    echo "system:$(go version |awk '{print $3}' |sed -e 's,go,,')"
	fi
    else
	echo "system:$(go version |awk '{print $3}' |sed -e 's,go,,')"
    fi
}

goev() {

    eval `goenv shell $1`
}


__setup
