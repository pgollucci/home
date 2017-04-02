aws_sqs_message_send() {
    local message-body="$1"
    local queue-url="$2"
    shift 2

    cond_log_and_run aws sqs  --message-body $message_body --queue-url $queue_url "@"

}
