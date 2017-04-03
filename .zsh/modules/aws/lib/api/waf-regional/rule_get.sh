aws_waf-regional_rule_get() {
    local rule_id="$1"
    shift 1

    log_and_run aws waf-regional get-rule --rule-id $rule_id "$@"
}
