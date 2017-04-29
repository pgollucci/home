aws_lex_models_bot_alias_get() {
    local name="$1"
    local bot_name="$2"
    shift 2

    log_and_run aws lex-models get-bot-alias --name $name --bot-name $bot_name "$@"
}
