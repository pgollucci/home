theme_setup() {

    export PAGER=less
    export LESS=-R
    export RUBY_SHELL=ripl
    export DIFF_OPTIONS=-u
    export MYSQL_PS1="\v \u@\h:\p (\d)>"

    unsetopt correct_all
}

theme_setup

