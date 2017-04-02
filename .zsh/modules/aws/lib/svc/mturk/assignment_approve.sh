aws_mturk_assignment_approve() {
    local assignment-id="$1"
    shift 1

    cond_log_and_run aws mturk  --assignment-id $assignment_id "@"

}
