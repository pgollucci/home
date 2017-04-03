aws_pinpoint_import_job_get() {
    local application_id="$1"
    local job_id="$2"
    shift 2

    log_and_run aws pinpoint get-import-job --application-id $application_id --job-id $job_id "$@"
}
