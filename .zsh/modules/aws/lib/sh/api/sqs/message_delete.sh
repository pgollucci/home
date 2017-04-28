aws_sqs_message_delete() {
    local queue_url="$1"
    local receipt_handle="$2"
    shift 2

    cond_log_and_run aws sqs delete-message --queue-url $queue_url --receipt-handle $receipt_handle "$@"
}
