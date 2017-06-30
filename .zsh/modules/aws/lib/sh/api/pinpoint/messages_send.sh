aws_pinpoint_messages_send() {
    local application_id="$1"
    local message_request="$2"
    shift 2

    cond_log_and_run aws pinpoint send-messages --application-id $application_id --message-request $message_request "$@"
}
