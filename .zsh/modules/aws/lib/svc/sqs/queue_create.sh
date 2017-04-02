aws_sqs_queue_create() {
    local queue-name="$1"
    shift 1

    cond_log_and_run aws sqs  --queue-name $queue_name "@"

}
