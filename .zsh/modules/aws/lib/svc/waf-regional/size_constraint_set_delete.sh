aws_waf-regional_size_constraint_set_delete() {
    local change-token="$1"
    local size-constraint-set-id="$2"
    shift 2

    cond_log_and_run aws waf-regional  --change-token $change_token --size-constraint-set-id $size_constraint_set_id "@"

}
