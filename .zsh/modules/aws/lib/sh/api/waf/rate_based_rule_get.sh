aws_waf_rate_based_rule_get() {
    local rule_id="$1"
    shift 1

    log_and_run aws waf get-rate-based-rule --rule-id $rule_id "$@"
}
