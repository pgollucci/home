aws_mturk_assignment_approve() {
    local assignment_id="$1"
    shift 1

    cond_log_and_run aws mturk approve-assignment --assignment-id $assignment_id "$@"
}
