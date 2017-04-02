aws_importexport_status_get() {
    local job-id="$1"
    shift 1

    log_and_run aws importexport  --job-id $job_id "@"

}
