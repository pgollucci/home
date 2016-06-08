theme_setup() {

    export PAGER=less
    export LESS=-R
    export RUBY_SHELL=ripl
    export DIFF_OPTIONS=-u
    export MYSQL_PS1="\v \u@\h:\p (\d)>"
    export EDITOR=emacs_wrapper

    unsetopt correct_all
}

my_prompt_lines() {

    echo "std pyenv rbenv plenv proxy git aws %local% dir blank"
}

theme_setup
