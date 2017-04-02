aws_sns_subscription_attributes_get() {
    local subscription-arn="$1"
    shift 1

    log_and_run aws sns  --subscription-arn $subscription_arn "@"

}
