aws_pinpoint_segment_update() {
    local segment-id="$1"
    local write-segment-request="$2"
    local application-id="$3"
    shift 3

    cond_log_and_run aws pinpoint  --segment-id $segment_id --write-segment-request $write_segment_request --application-id $application_id "@"

}
