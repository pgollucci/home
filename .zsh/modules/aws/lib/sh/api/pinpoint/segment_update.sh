aws_pinpoint_segment_update() {
    local application_id="$1"
    local segment_id="$2"
    local write_segment_request="$3"
    shift 3

    cond_log_and_run aws pinpoint update-segment --application-id $application_id --segment-id $segment_id --write-segment-request $write_segment_request "$@"
}
