aws_sns_subscription_attributes_set() {
    local subscription_arn="$1"
    local attribute_name="$2"
    shift 2

    cond_log_and_run aws sns set-subscription-attributes --subscription-arn $subscription_arn --attribute-name $attribute_name "$@"
}
