aws_pinpoint_import_job_get() {
    local job-id="$1"
    local application-id="$2"
    shift 2

    log_and_run aws pinpoint  --job-id $job_id --application-id $application_id "@"

}
