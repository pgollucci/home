aws_waf-regional_rule_create() {
    local metric-name="$1"
    local change-token="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws waf-regional  --metric-name $metric_name --change-token $change_token --name $name "@"

}
