aws_pinpoint_segment_version_get() {
    local segment-version="$1"
    local segment-id="$2"
    local application-id="$3"
    shift 3

    log_and_run aws pinpoint  --segment-version $segment_version --segment-id $segment_id --application-id $application_id "@"

}
