aws_waf_rule_create() {
    local name="$1"
    local metric_name="$2"
    local change_token="$3"
    shift 3

    cond_log_and_run aws waf create-rule --name $name --metric-name $metric_name --change-token $change_token "$@"
}
