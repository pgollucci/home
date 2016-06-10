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

run_time_prompt() {

    local prompt_func
    for prompt_func in "$@"; do
	case $prompt_func in
	    blank_prompt_line) print " " ;;
	    * )
		local output="$($prompt_func)"
		[ -n "$output" ] && echo $output
	esac
    done
}

prompt_load() { # args: reset_flag  func

    setopt PROMPT_SUBST

    local my_prompts="$(my_prompt_lines)"
    local local_prompts=""

    declare -f local_prompt_lines > /dev/null
    if [ $? -eq 0 ]; then
	local_prompts="$(local_prompt_lines)"
    fi

    local prompt_funcs="$(echo $my_prompts | \
				sed -e "s,%local%,$local_prompts,g" \
				    -e "s,  , ,g" \
				    -e 's, ,_prompt_line ,g' \
				    -e 's, ," ",g' \
				    -e 's,^,",' \
				    -e 's,$,_prompt_line",')"

    PROMPT="\$(run_time_prompt $prompt_funcs)"
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

run_parallel() {
    local i="$1"
    local parallel="$2"
    local things="$3"
    shift 3
    local cmd="$1"
    shift 1

    local thing
    for thing in $(echo $things); do
	((i=i%parallel)); ((i++==0)) && wait
	local rc="$($cmd $@ "$thing" > /tmp/stdout-$thing 2>&/tmp/stderr-$thing)" &
    done
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
