aws_mturk_assignment_reject() {
    local assignment_id="$1"
    shift 1

    cond_log_and_run aws mturk reject-assignment --assignment-id $assignment_id "$@"
}
