aws_lex_models_intent_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws lex-models delete-intent --name $name "$@"
}
