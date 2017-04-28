aws_pinpoint_segment_create() {
    local application_id="$1"
    local write_segment_request="$2"
    shift 2

    cond_log_and_run aws pinpoint create-segment --application-id $application_id --write-segment-request $write_segment_request "$@"
}
