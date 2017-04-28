aws_sqs_permission_remove() {
    local queue_url="$1"
    local label="$2"
    shift 2

    cond_log_and_run aws sqs remove-permission --queue-url $queue_url --label $label "$@"
}
