aws_sqs_queue_purge() {
    local queue-url="$1"
    shift 1

    cond_log_and_run aws sqs  --queue-url $queue_url "@"

}
