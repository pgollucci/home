aws_configservice_config_rule_put() {
    local config_rule="$1"
    shift 1

    cond_log_and_run aws configservice put-config-rule --config-rule $config_rule "$@"
}
