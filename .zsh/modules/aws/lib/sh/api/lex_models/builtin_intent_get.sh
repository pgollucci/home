aws_lex_models_builtin_intent_get() {
    local signature="$1"
    shift 1

    log_and_run aws lex-models get-builtin-intent --signature $signature "$@"
}
