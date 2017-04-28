aws_sqs_message_batch_delete() {
    local queue_url="$1"
    local entries="$2"
    shift 2

    cond_log_and_run aws sqs delete-message-batch --queue-url $queue_url --entries $entries "$@"
}
