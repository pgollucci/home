aws_pinpoint_event_stream_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-event-stream --application-id $application_id "$@"
}
