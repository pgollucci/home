aws_lex-runtime_text_post() {
    local bot-alias="$1"
    local bot-name="$2"
    local input-text="$3"
    local user-id="$4"
    shift 4

    cond_log_and_run aws lex-runtime  --bot-alias $bot_alias --bot-name $bot_name --input-text $input_text --user-id $user_id "@"

}
