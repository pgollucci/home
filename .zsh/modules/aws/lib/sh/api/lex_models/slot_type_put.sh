aws_lex_models_slot_type_put() {
    local name="$1"
    shift 1

    cond_log_and_run aws lex-models put-slot-type --name $name "$@"
}
