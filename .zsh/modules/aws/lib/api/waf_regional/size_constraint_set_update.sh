aws_waf-regional_size_constraint_set_update() {
    local size_constraint_set_id="$1"
    local change_token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf-regional update-size-constraint-set --size-constraint-set-id $size_constraint_set_id --change-token $change_token --updates $updates "$@"
}
