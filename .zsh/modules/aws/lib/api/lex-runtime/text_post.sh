aws_lex-runtime_text_post() {
    local bot_name="$1"
    local bot_alias="$2"
    local user_id="$3"
    local input_text="$4"
    shift 4

    cond_log_and_run aws lex-runtime post-text --bot-name $bot_name --bot-alias $bot_alias --user-id $user_id --input-text $input_text "$@"
}
