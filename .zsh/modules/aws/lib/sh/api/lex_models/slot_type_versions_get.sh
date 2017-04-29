aws_lex_models_slot_type_versions_get() {
    local name="$1"
    shift 1

    log_and_run aws lex-models get-slot-type-versions --name $name "$@"
}
