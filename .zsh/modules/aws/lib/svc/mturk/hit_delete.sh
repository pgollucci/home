aws_mturk_hit_delete() {
    local hit-id="$1"
    shift 1

    cond_log_and_run aws mturk  --hit-id $hit_id "@"

}
