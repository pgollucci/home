aws_configservice_compliance_by_config_rule_describe() {
    shift 0

    log_and_run aws configservice describe-compliance-by-config-rule "$@"
}
