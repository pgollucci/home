aws_mturk_hit_get() {
    local hit_id="$1"
    shift 1

    log_and_run aws mturk get-hit --hit-id $hit_id "$@"
}
