aws_mturk_hit_get() {
    local hit-id="$1"
    shift 1

    log_and_run aws mturk  --hit-id $hit_id "@"

}
