aws_sns_subscriptions_by_topic_list() {
    local topic-arn="$1"
    shift 1

    log_and_run aws sns  --topic-arn $topic_arn "@"

}
