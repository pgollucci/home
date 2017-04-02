aws_pinpoint_import_jobs_get() {
    local application-id="$1"
    shift 1

    log_and_run aws pinpoint  --application-id $application_id "@"

}
