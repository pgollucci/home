aws_snowball_job_describe() {
    local job-id="$1"
    shift 1

    log_and_run aws snowball  --job-id $job_id "@"

}
