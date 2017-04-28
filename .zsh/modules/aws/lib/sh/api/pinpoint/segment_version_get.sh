aws_pinpoint_segment_version_get() {
    local application_id="$1"
    local segment_id="$2"
    local segment_version="$3"
    shift 3

    log_and_run aws pinpoint get-segment-version --application-id $application_id --segment-id $segment_id --segment-version $segment_version "$@"
}
