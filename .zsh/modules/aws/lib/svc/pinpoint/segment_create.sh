aws_pinpoint_segment_create() {
    local write-segment-request="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --write-segment-request $write_segment_request --application-id $application_id "@"

}
