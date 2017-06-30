aws_waf_rate_based_rule_managed_keys_get() {
    local rule_id="$1"
    shift 1

    log_and_run aws waf get-rate-based-rule-managed-keys --rule-id $rule_id "$@"
}
