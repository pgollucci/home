aws_pinpoint_segment_delete() {
    local application_id="$1"
    local segment_id="$2"
    shift 2

    cond_log_and_run aws pinpoint delete-segment --application-id $application_id --segment-id $segment_id "$@"
}
