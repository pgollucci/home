aws_lex_models_utterances_view_get() {
    local bot_name="$1"
    local bot_versions="$2"
    local status_type="$3"
    shift 3

    log_and_run aws lex-models get-utterances-view --bot-name $bot_name --bot-versions $bot_versions --status-type $status_type "$@"
}
