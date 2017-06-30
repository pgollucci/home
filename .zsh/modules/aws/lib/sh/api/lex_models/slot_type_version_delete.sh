aws_lex_models_slot_type_version_delete() {
    local name="$1"
    local slot_type_version="$2"
    shift 2

    cond_log_and_run aws lex-models delete-slot-type-version --name $name --slot-type-version $slot_type_version "$@"
}
