aws_sqs_queue_attributes_set() {
    local attributes="$1"
    local queue-url="$2"
    shift 2

    cond_log_and_run aws sqs  --attributes $attributes --queue-url $queue_url "@"

}
