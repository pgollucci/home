aws_lex_models_utterances_delete() {
    local bot_name="$1"
    local user_id="$2"
    shift 2

    cond_log_and_run aws lex-models delete-utterances --bot-name $bot_name --user-id $user_id "$@"
}
