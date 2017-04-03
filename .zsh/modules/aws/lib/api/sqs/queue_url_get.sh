aws_sqs_queue_url_get() {
    local queue_name="$1"
    shift 1

    log_and_run aws sqs get-queue-url --queue-name $queue_name "$@"
}
