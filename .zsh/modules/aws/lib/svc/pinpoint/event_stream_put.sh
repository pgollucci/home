aws_pinpoint_event_stream_put() {
    local write-event-stream="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --write-event-stream $write_event_stream --application-id $application_id "@"

}
