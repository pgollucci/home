aws_waf_rule_delete() {
    local change-token="$1"
    local rule-id="$2"
    shift 2

    cond_log_and_run aws waf  --change-token $change_token --rule-id $rule_id "@"

}
