aws_rds_event_subscription_create() {
    local sns-topic-arn="$1"
    local subscription-name="$2"
    shift 2

    cond_log_and_run aws rds  --sns-topic-arn $sns_topic_arn --subscription-name $subscription_name "@"

}
