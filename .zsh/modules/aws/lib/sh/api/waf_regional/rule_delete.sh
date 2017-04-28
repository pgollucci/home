aws_waf_regional_rule_delete() {
    local rule_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-rule --rule-id $rule_id --change-token $change_token "$@"
}
