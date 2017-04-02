aws_sqs_queue_url_get() {
    local queue-name="$1"
    shift 1

    log_and_run aws sqs  --queue-name $queue_name "@"

}
