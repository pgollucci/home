aws_waf_regional_rate_based_rule_create() {
    local name="$1"
    local metric_name="$2"
    local rate_key="$3"
    local rate_limit="$4"
    local change_token="$5"
    shift 5

    cond_log_and_run aws waf-regional create-rate-based-rule --name $name --metric-name $metric_name --rate-key $rate_key --rate-limit $rate_limit --change-token $change_token "$@"
}
