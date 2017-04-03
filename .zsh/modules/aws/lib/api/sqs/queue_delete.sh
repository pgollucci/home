aws_sqs_queue_delete() {
    local queue_url="$1"
    shift 1

    cond_log_and_run aws sqs delete-queue --queue-url $queue_url "$@"
}
