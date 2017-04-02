aws_waf-regional_rule_delete() {
    local rule-id="$1"
    local change-token="$2"
    shift 2

    cond_log_and_run aws waf-regional  --rule-id $rule_id --change-token $change_token "@"

}
