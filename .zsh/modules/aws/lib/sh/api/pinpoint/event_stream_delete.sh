aws_pinpoint_event_stream_delete() {
    local application_id="$1"
    shift 1

    cond_log_and_run aws pinpoint delete-event-stream --application-id $application_id "$@"
}
