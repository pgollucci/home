__setup() {

    export PLENV_ROOT=$HOME/.repos/langs/plenv
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

    if [ $HAS_PLENV ]; then
	local ver=$(plenv version-name)
	if [ x"$ver" != x"system" ]; then
	    echo $ver
	else
	    echo "sys:$(perl -v 2>&1 | awk '/\(v5/ { print $9 }' | sed -e 's,[\)\(v],,g')"
	fi
    else
	echo "sys:$(perl -v 2>&1 | awk '/\(v5/ { print $9 }' | sed -e 's,[\)\(v],,g')"
    fi
}

__setup
