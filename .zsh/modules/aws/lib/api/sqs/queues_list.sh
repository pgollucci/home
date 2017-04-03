aws_sqs_queues_list() {
    shift 0

    log_and_run aws sqs list-queues "$@"
}
