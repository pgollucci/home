aws_configservice_compliance_details_by_config_rule_get() {
    local config-rule-name="$1"
    shift 1

    log_and_run aws configservice  --config-rule-name $config_rule_name "@"

}
