aws_snowball_job_cancel() {
    local job-id="$1"
    shift 1

    cond_log_and_run aws snowball  --job-id $job_id "@"

}
