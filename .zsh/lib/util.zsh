zprezto_load() {

    . $HOME/.zprezto/init.zsh
}

zplug_load() {

    . $HOME/.zplug/zplug

    zprezto_load
}

zplug_run() {

     zplug install
     zplug load
}

modules_load() { # args: modules_dir
    local modules_dir="$1"

    local module
    for module in $modules_dir/*; do
	module_load "$module"
    done
}

module_load() { # args: module_dir
    local module_dir="$1"

    export ___dir=$module_dir
    if [ -d $module_dir ]; then
	. $module_dir/cfg.zsh
    fi
    unset ___dir
}

theme_load() { # args: theme_dir
    local theme_dir="$1"

    . $theme_dir/cfg.zsh
}

prompt_load() { # args: reset_flag
    local reset_flag="$1"
    local func="$2"

    [ $reset_flag -eq 1 ] && PROMPT=

    setopt PROMPT_SUBST

    local prompt_lines="$(${func}_prompt_lines)"
    local pl
    for pl in $(echo $prompt_lines); do
	if [ x"$pl" = x"%local%" ]; then
	    prompt_load "0" "local"
	else
	    local prompt_info="$(${pl}_prompt_line)"
	    PROMPT="$PROMPT
$prompt_info"
	fi
    done
}

local_dir_get() { # args: local_dir
    local local_dir="$1"

    local dns=$(hostname -f)
    local dir=$local_dir/$dns

    echo $dir
}

local_load() {
    local local_dir="$1"

    if [ -d "$local_dir" ]; then
	modules_load "$local_dir"
    fi
}

completions_load() { # completions_dir
    local completions_dir="$1"

    local dir
    for dir in $completions_dir/*; do
	fpath+=($dir)
    done
}

init_cap() {
    local str="$1"

    echo $str | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'
}

msg() {
    echo "$@"
}

log() {
    echo "$@"
}

error() {
    echo >2 "$@"
}

die() {
    echo >2 "$@"
    exit 1
}

debug() {
    [ -n "$DEBUG" ] || return

    echo "$@"
}
