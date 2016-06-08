__setup() {

    export GOENV_ROOT=$HOME/.repos/langs/goenv
    path_if $GOENV_ROOT/bin

    if [ -x $GOENV_ROOT/bin/goenv ]; then
      export HAS_GOENV=1
      eval "$(goenv init - zsh)"
    fi
}

goenv_prompt_line() {

    echo "${magenta}goenv: [$(goenv_version)]${norm}"
}

goenv_version() {

    if [ $HAS_GOENV ]; then
	local ver=$(goenv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "system:$(go version |awk '{print $3}' |sed -e 's,go,,')"
	fi
    else
	echo "system:$(go version |awk '{print $3}' |sed -e 's,go,,')"
    fi
}

__setup
