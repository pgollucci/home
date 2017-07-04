# ZSH initialization man zsh(1)
#
# if ZDOTDIR is unset HOME is used
# /etc is install specific
#
# /etc/zshenv
# ZDOTDIR/.zshenv
# if login
#   /etc/zprofile
#   $ZDOTDIR/.zprofile
# if interactive
#      /etc/zshrc
#      $ZDOTDIR/.zshrc (me)
# if login
#   /etc/zlogin
#   $ZDOTDIR/.zlogin

__load() {

    local DEBUG=1
    local DISABLE_ENVS=""
    [ -n "$DEBUG" -a $DEBUG -gt 1 ] && set -x

    ZDOTDIR=$HOME
    ZSH_DIR=$ZDOTDIR/.zsh
    ZPLUG_ROOT=$ZDOTDIR/.repos/zsh/zplug
    ZPLUG_HOME=$ZPLUG_ROOT

    . $ZSH_DIR/lib/util.zsh
    . $ZSH_DIR/modules/_util/cfg.zsh

    local theme="default"

    local modules_dir=$ZSH_DIR/modules
    local local_dir=$ZSH_DIR/local
    local themes_dir=$ZSH_DIR/themes
    local prompts_dir=$ZSH_DIR/prompts
    local completions_dir=$ZSH_DIR/completions

    local theme_dir="$themes_dir/$theme"
    local prompt_dir="$theme_dir"
    local local_host_dir=$(local_dir_get $local_dir)

    zplug_load
    theme_load "$theme_dir"
    modules_load "$modules_dir"
    local_load "$local_host_dir"
    prompt_load "1" "my"
    completions_load "$completions_dir"
    zplug_run

    set +x
}

__load
