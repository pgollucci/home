aws_greengrass_subscription_definition_delete() {
    local subscription_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-subscription-definition --subscription-definition-id $subscription_definition_id "$@"
}
