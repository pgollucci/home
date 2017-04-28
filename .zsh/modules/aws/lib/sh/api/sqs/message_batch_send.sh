aws_sqs_message_batch_send() {
    local queue_url="$1"
    local entries="$2"
    shift 2

    cond_log_and_run aws sqs send-message-batch --queue-url $queue_url --entries $entries "$@"
}
