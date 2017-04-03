aws_sns_subscription_confirm() {
    local topic_arn="$1"
    local token="$2"
    shift 2

    cond_log_and_run aws sns confirm-subscription --topic-arn $topic_arn --token $token "$@"
}
