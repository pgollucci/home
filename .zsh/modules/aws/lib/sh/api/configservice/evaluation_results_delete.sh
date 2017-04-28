aws_configservice_evaluation_results_delete() {
    local config_rule_name="$1"
    shift 1

    cond_log_and_run aws configservice delete-evaluation-results --config-rule-name $config_rule_name "$@"
}
