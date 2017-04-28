aws_sqs_message_visibility_batch_change() {
    local queue_url="$1"
    local entries="$2"
    shift 2

    cond_log_and_run aws sqs change-message-visibility-batch --queue-url $queue_url --entries $entries "$@"
}
