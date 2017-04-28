aws_sns_topic_attributes_get() {
    local topic_arn="$1"
    shift 1

    log_and_run aws sns get-topic-attributes --topic-arn $topic_arn "$@"
}
