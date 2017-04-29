aws_lex_models_bot_channel_associations_get() {
    local bot_name="$1"
    local bot_alias="$2"
    shift 2

    log_and_run aws lex-models get-bot-channel-associations --bot-name $bot_name --bot-alias $bot_alias "$@"
}
