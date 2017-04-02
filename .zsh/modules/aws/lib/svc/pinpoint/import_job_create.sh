aws_pinpoint_import_job_create() {
    local import-job-request="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --import-job-request $import_job_request --application-id $application_id "@"

}
