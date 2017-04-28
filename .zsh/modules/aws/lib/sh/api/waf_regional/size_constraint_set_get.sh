aws_waf_regional_size_constraint_set_get() {
    local size_constraint_set_id="$1"
    shift 1

    log_and_run aws waf-regional get-size-constraint-set --size-constraint-set-id $size_constraint_set_id "$@"
}
