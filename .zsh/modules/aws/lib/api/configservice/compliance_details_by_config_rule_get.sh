aws_configservice_compliance_details_by_config_rule_get() {
    local config_rule_name="$1"
    shift 1

    log_and_run aws configservice get-compliance-details-by-config-rule --config-rule-name $config_rule_name "$@"
}
