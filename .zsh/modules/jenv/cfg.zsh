__setup() {

    export JENV_ROOT=$HOME/.repos/langs/jenv
    path_if $JENV_ROOT/bin

    if [ -x $JENV_ROOT/bin/jenv ]; then
      export HAS_JENV=1
      eval "$(jenv init - )"
    fi
}

jenv_prompt_line() {

    echo "${magenta}jenv: [$(jenv_version)]${norm}"
}

jenv_version() {

    if [ $HAS_JENV ]; then
	if [ -n "$JENV_VERSION" ]; then
	    echo "$JENV_VERSION"
	else
	    local ver=$(jenv version | awk '{print $1}')
	    echo "$ver"
	fi
    else
	echo "system:$(java -version 2>&1|awk '/Environment/{print}' | cut -d' ' -f 2,6- |sed -e 's,),,')"
    fi
}

jev() {

    eval `jenv shell $1`
}


__setup
