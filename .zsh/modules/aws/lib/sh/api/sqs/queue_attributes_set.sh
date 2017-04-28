aws_sqs_queue_attributes_set() {
    local queue_url="$1"
    local attributes="$2"
    shift 2

    cond_log_and_run aws sqs set-queue-attributes --queue-url $queue_url --attributes $attributes "$@"
}
