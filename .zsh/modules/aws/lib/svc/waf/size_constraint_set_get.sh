aws_waf_size_constraint_set_get() {
    local size-constraint-set-id="$1"
    shift 1

    log_and_run aws waf  --size-constraint-set-id $size_constraint_set_id "@"

}
