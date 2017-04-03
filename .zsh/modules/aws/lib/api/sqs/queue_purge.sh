aws_sqs_queue_purge() {
    local queue_url="$1"
    shift 1

    cond_log_and_run aws sqs purge-queue --queue-url $queue_url "$@"
}
