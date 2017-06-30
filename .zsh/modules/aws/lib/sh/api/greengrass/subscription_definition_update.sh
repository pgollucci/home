aws_greengrass_subscription_definition_update() {
    local subscription_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-subscription-definition --subscription-definition-id $subscription_definition_id "$@"
}
