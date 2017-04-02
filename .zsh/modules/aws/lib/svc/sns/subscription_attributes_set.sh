aws_sns_subscription_attributes_set() {
    local attribute-name="$1"
    local subscription-arn="$2"
    shift 2

    cond_log_and_run aws sns  --attribute-name $attribute_name --subscription-arn $subscription_arn "@"

}
