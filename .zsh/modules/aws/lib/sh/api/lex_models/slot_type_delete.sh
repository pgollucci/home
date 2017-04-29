aws_lex_models_slot_type_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws lex-models delete-slot-type --name $name "$@"
}
