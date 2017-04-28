aws_snowball_job_describe() {
    local job_id="$1"
    shift 1

    log_and_run aws snowball describe-job --job-id $job_id "$@"
}
