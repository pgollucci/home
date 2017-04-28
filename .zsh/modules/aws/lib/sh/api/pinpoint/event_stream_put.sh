aws_pinpoint_event_stream_put() {
    local application_id="$1"
    local write_event_stream="$2"
    shift 2

    cond_log_and_run aws pinpoint put-event-stream --application-id $application_id --write-event-stream $write_event_stream "$@"
}
