aws_snowball_job_cancel() {
    local job_id="$1"
    shift 1

    cond_log_and_run aws snowball cancel-job --job-id $job_id "$@"
}
