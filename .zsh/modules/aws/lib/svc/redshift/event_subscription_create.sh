aws_redshift_event_subscription_create() {
    local subscription-name="$1"
    local sns-topic-arn="$2"
    shift 2

    cond_log_and_run aws redshift  --subscription-name $subscription_name --sns-topic-arn $sns_topic_arn "@"

}
