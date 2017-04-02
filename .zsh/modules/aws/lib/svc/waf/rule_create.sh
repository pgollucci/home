aws_waf_rule_create() {
    local name="$1"
    local change-token="$2"
    local metric-name="$3"
    shift 3

    cond_log_and_run aws waf  --name $name --change-token $change_token --metric-name $metric_name "@"

}
