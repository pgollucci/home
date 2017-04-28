aws_sqs_message_send() {
    local queue_url="$1"
    local message_body="$2"
    shift 2

    cond_log_and_run aws sqs send-message --queue-url $queue_url --message-body $message_body "$@"
}
