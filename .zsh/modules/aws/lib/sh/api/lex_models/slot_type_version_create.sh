aws_lex_models_slot_type_version_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws lex-models create-slot-type-version --name $name "$@"
}
