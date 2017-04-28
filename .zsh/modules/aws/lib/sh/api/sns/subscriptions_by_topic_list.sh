aws_sns_subscriptions_by_topic_list() {
    local topic_arn="$1"
    shift 1

    log_and_run aws sns list-subscriptions-by-topic --topic-arn $topic_arn "$@"
}
