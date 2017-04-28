aws_mturk_assignment_get() {
    local assignment_id="$1"
    shift 1

    log_and_run aws mturk get-assignment --assignment-id $assignment_id "$@"
}
