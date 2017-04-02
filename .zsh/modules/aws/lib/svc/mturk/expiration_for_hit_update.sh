aws_mturk_expiration_for_hit_update() {
    local hit-id="$1"
    shift 1

    cond_log_and_run aws mturk  --hit-id $hit_id "@"

}
