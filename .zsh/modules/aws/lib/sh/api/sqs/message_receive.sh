aws_sqs_message_receive() {
    local queue_url="$1"
    shift 1

    cond_log_and_run aws sqs receive-message --queue-url $queue_url "$@"
}
