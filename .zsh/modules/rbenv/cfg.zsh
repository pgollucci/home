__setup() {

    export RBENV_ROOT=$HOME/.repos/langs/rbenv
    path_if $RBENV_ROOT/bin

    if [ -x $RBENV_ROOT/bin/rbenv ]; then
	export HAS_RBENV=1
	eval "$(rbenv init - zsh)"
    fi
}

rbenv_prompt_line() {

    echo "${magenta}rbenv: [$(rbenv_version)]${norm}"
}

rbenv_version() {

    if [ $HAS_RBENV ]; then
	rbenv version-name
    else
	echo "system:$(ruby -v 2>&1 | cut -f 2 -d ' ')"
    fi
}

__setup
