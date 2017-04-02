aws_sqs_message_delete() {
    local receipt-handle="$1"
    local queue-url="$2"
    shift 2

    cond_log_and_run aws sqs  --receipt-handle $receipt_handle --queue-url $queue_url "@"

}
