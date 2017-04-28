aws_pinpoint_segment_get() {
    local application_id="$1"
    local segment_id="$2"
    shift 2

    log_and_run aws pinpoint get-segment --application-id $application_id --segment-id $segment_id "$@"
}
