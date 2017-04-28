aws_sqs_dead_letter_source_queues_list() {
    local queue_url="$1"
    shift 1

    log_and_run aws sqs list-dead-letter-source-queues --queue-url $queue_url "$@"
}
