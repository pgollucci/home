aws_waf-regional_size_constraint_set_delete() {
    local size_constraint_set_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-size-constraint-set --size-constraint-set-id $size_constraint_set_id --change-token $change_token "$@"
}
