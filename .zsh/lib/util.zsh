path_if() { # args: dir
  local dir=$1
  if [ -d $dir ]; then
    PATH="${PATH}:$dir"
  fi
}

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
    . $module_dir/cfg.zsh
    unset ___dir
}

theme_load() { # args: theme_dir
    local theme_dir="$1"

    . $theme_dir/cfg.zsh
}

prompt_load() { # args: prompts_dir prompt_dir
    local local_dir="$1"
    local prompts_dir="$2"
    local prompt_dir="$3"
    local reset_flag="$4"

    local prompt_lines
    [ -r $prompt_dir/prompt.zsh ] || return
   . $prompt_dir/prompt.zsh

    setopt PROMPT_SUBST

    [ $reset_flag -eq 1 ] && PROMPT=

    local pl
    for pl in $(echo $prompt_lines); do
	if [ x"$pl" = x"%local%" ]; then
	    prompt_load "$local_dir" "$local_dir/prompts" "$local_dir/prompts" "0"
	else
	    . $prompts_dir/$pl.zsh
	    if [ -z "$prompt_info" -a "$pl" != "blank" ]; then
		continue
	    fi
	    if [ -z "$PROMPT" ]; then
		PROMPT=$prompt_info
	    else
		PROMPT="$PROMPT
$prompt_info"
	    fi
	fi
    done
}

local_dir_get() { # args: local_dir
    local local_dir="$1"

    local dns=$(hostname -f)
    local dir=$local_dir/$dns

    echo $dir
}

local_load() { # args: local_dir
    local local_dir="$1"

    [ -d $local_dir ] || return

    local module
    for module in $local_dir/*; do
	if [ x"$module" != x"$local_dir/prompts" ]; then
	  module_load $module
	fi
    done
}

completions_load() { # completions_dir
    local completions_dir="$1"

    local dir
    for dir in $completions_dir/*; do
	fpath+=($dir)
    done
}

cd_make_aliases() { # args: dir
    local dir="$1"

    if [ -d $dir ]; then
	local d
	for d in $(cd $dir ; /bin/ls -1d *); do
	    eval "alias cd$d='cd $dir/$d'"
	done
    fi
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
