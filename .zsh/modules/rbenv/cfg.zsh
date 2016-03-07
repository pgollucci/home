__setup() {

    export RBENV_ROOT=$HOME/.repos/langs/rbenv
    export PATH=$RBENV_ROOT/bin:$PATH

    if [ -x $RBENV_ROOT/bin/rbenv ]; then
        export HAS_RBENV=1
        eval "$(rbenv init - zsh)"
    fi
}

rbenv_prompt_info() {
    echo "rbenv: [$(rbenv_version)]"
}

rbenv_version() {

    if [ $HAS_RBENV ]; then
	rbenv version-name
    else
	echo "system:$(ruby -v 2>&1 | cut -f 2 -d ' ')"
    fi
}

__setup
