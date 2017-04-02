aws_sqs_message_batch_delete() {
    local entries="$1"
    local queue-url="$2"
    shift 2

    cond_log_and_run aws sqs  --entries $entries --queue-url $queue_url "@"

}
