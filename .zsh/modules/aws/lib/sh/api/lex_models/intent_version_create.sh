aws_lex_models_intent_version_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws lex-models create-intent-version --name $name "$@"
}
