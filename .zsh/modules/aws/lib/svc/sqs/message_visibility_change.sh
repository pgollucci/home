aws_sqs_message_visibility_change() {
    local queue-url="$1"
    local visibility-timeout="$2"
    local receipt-handle="$3"
    shift 3

    cond_log_and_run aws sqs  --queue-url $queue_url --visibility-timeout $visibility_timeout --receipt-handle $receipt_handle "@"

}
