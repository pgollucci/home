aws_waf-regional_size_constraint_set_update() {
    local change-token="$1"
    local updates="$2"
    local size-constraint-set-id="$3"
    shift 3

    cond_log_and_run aws waf-regional  --change-token $change_token --updates $updates --size-constraint-set-id $size_constraint_set_id "@"

}
