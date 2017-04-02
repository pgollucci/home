aws_waf_rule_get() {
    local rule-id="$1"
    shift 1

    log_and_run aws waf  --rule-id $rule_id "@"

}
