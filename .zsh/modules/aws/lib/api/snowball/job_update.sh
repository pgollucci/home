aws_snowball_job_update() {
    local job_id="$1"
    shift 1

    cond_log_and_run aws snowball update-job --job-id $job_id "$@"
}
