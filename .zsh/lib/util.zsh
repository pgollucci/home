zprezto_load() {

    load_file "$P6_SRC_GH_DIR/sorin-ionescu/prezto/init.zsh"
}

zplug_load() {

    load_file "$P6_SRC_GH_DIR/zplug/zplug/init.zsh"

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
	debug "=====> $module_dir/cfg.zsh"
	load_file "$module_dir/cfg.zsh"
	debug "<===== $module_dir/cfg.zsh"
    fi
    unset ___dir
}

theme_load() { # args: theme_dir
    local theme_dir="$1"

    load_file "$theme_dir/cfg.zsh"
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

msg() {
    echo "$@"
}

Log() { msg "$@" }

error() {
    echo >2 "$@"
}

verbose() {
    local level="$1"
    shift

    VERBOSE=${VERBOSE:-0}
    [ $VERBOSE -ne 0 -a \( $level -gt $VERBOSE -o $level -eq $VERBOSE \) ] && echo "$@"
}

debug() {
    [ -n "$DEBUG" ] || return

    echo >&2 "$@"
}

die() {
    local code="$1"
    shift

    echo "$@"
    exit $code
}

header() {
    local indent="$1"
    shift

    local i=0
    while [ $i -lt $indent ]; do
	echo "=\c"
	i=$(($i+1))
    done

    echo "> \c"
    echo "$@"
}
