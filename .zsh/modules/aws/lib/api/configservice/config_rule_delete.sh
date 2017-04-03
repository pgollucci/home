aws_configservice_config_rule_delete() {
    local config_rule_name="$1"
    shift 1

    cond_log_and_run aws configservice delete-config-rule --config-rule-name $config_rule_name "$@"
}
