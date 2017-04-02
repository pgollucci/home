aws_pinpoint_segment_import_jobs_get() {
    local segment-id="$1"
    local application-id="$2"
    shift 2

    log_and_run aws pinpoint  --segment-id $segment_id --application-id $application_id "@"

}
