aws_sqs_queue_attributes_get() {
    local queue-url="$1"
    shift 1

    log_and_run aws sqs  --queue-url $queue_url "@"

}
