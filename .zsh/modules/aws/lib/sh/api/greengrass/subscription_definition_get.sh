aws_greengrass_subscription_definition_get() {
    local subscription_definition_id="$1"
    shift 1

    log_and_run aws greengrass get-subscription-definition --subscription-definition-id $subscription_definition_id "$@"
}
