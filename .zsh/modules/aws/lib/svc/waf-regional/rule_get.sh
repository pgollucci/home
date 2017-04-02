aws_waf-regional_rule_get() {
    local rule-id="$1"
    shift 1

    log_and_run aws waf-regional  --rule-id $rule_id "@"

}
