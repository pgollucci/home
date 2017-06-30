aws_lex_models_intent_version_delete() {
    local name="$1"
    local intent_version="$2"
    shift 2

    cond_log_and_run aws lex-models delete-intent-version --name $name --intent-version $intent_version "$@"
}
