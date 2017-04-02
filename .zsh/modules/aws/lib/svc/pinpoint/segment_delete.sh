aws_pinpoint_segment_delete() {
    local segment-id="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --segment-id $segment_id --application-id $application_id "@"

}
