aws_lex_models_bot_aliases_get() {
    local bot_name="$1"
    shift 1

    log_and_run aws lex-models get-bot-aliases --bot-name $bot_name "$@"
}
