aws_greengrass_subscription_definition_versions_list() {
    local subscription_definition_id="$1"
    shift 1

    log_and_run aws greengrass list-subscription-definition-versions --subscription-definition-id $subscription_definition_id "$@"
}
