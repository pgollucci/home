aws_pinpoint_segment_versions_get() {
    local application-id="$1"
    local segment-id="$2"
    shift 2

    log_and_run aws pinpoint  --application-id $application_id --segment-id $segment_id "@"

}
