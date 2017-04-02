aws_mturk_assignment_get() {
    local assignment-id="$1"
    shift 1

    log_and_run aws mturk  --assignment-id $assignment_id "@"

}
