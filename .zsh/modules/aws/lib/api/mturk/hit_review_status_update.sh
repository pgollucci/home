aws_mturk_hit_review_status_update() {
    local hit_id="$1"
    shift 1

    cond_log_and_run aws mturk update-hit-review-status --hit-id $hit_id "$@"
}
