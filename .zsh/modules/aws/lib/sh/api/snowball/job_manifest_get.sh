aws_snowball_job_manifest_get() {
    local job_id="$1"
    shift 1

    log_and_run aws snowball get-job-manifest --job-id $job_id "$@"
}
