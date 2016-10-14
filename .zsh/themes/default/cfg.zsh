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

    echo "std langs proxy git aws %local% rv dir blank"
}

langs_prompt_line() {

    local output=""

    local lang
    for lang in pyenv rbenv plenv goenv jenv; do
	local lenv="$(${lang}_prompt_line)"
	output="$output $lenv"
    done

    echo $output | sed -e 's,^ *,,'
}

theme_setup
