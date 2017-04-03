aws_sqs_queue_create() {
    local queue_name="$1"
    shift 1

    cond_log_and_run aws sqs create-queue --queue-name $queue_name "$@"
}
