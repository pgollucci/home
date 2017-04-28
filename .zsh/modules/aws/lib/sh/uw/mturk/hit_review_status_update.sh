aws_mturk_revert() {
        local hit_id="$1"
        shift 1

    cond_log_and_run aws mturk update-hit-review-status --hit-id $hit_id --revert "$@"
}

