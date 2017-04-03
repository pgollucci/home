aws_configservice_config_rule_evaluation_status_describe() {
    shift 0

    log_and_run aws configservice describe-config-rule-evaluation-status "$@"
}
