aws_greengrass_subscription_definition_version_create() {
    local subscription_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-subscription-definition-version --subscription-definition-id $subscription_definition_id "$@"
}
