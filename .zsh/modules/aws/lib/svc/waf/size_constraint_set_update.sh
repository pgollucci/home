aws_waf_size_constraint_set_update() {
    local size-constraint-set-id="$1"
    local updates="$2"
    local change-token="$3"
    shift 3

    cond_log_and_run aws waf  --size-constraint-set-id $size_constraint_set_id --updates $updates --change-token $change_token "@"

}
