aws_iot_topic_rules_list() {
    shift 0

    log_and_run aws iot list-topic-rules "$@"
}
