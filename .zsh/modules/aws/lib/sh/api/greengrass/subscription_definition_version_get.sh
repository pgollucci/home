aws_greengrass_subscription_definition_version_get() {
    local subscription_definition_id="$1"
    local subscription_definition_version_id="$2"
    shift 2

    log_and_run aws greengrass get-subscription-definition-version --subscription-definition-id $subscription_definition_id --subscription-definition-version-id $subscription_definition_version_id "$@"
}
