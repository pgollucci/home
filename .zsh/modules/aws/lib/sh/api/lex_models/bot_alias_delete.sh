aws_lex_models_bot_alias_delete() {
    local name="$1"
    local bot_name="$2"
    shift 2

    cond_log_and_run aws lex-models delete-bot-alias --name $name --bot-name $bot_name "$@"
}
