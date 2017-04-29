aws_lex_models_bot_get() {
    local name="$1"
    local version_or_alias="$2"
    shift 2

    log_and_run aws lex-models get-bot --name $name --version-or-alias $version_or_alias "$@"
}
