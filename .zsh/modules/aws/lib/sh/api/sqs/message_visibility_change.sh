aws_sqs_message_visibility_change() {
    local queue_url="$1"
    local receipt_handle="$2"
    local visibility_timeout="$3"
    shift 3

    cond_log_and_run aws sqs change-message-visibility --queue-url $queue_url --receipt-handle $receipt_handle --visibility-timeout $visibility_timeout "$@"
}
