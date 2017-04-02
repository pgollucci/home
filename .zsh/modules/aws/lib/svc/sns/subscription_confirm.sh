aws_sns_subscription_confirm() {
    local token="$1"
    local topic-arn="$2"
    shift 2

    cond_log_and_run aws sns  --token $token --topic-arn $topic_arn "@"

}
