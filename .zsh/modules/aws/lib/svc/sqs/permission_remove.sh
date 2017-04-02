aws_sqs_permission_remove() {
    local label="$1"
    local queue-url="$2"
    shift 2

    cond_log_and_run aws sqs  --label $label --queue-url $queue_url "@"

}
