aws_importexport_status_get() {
    local job_id="$1"
    shift 1

    log_and_run aws importexport get-status --job-id $job_id "$@"
}
