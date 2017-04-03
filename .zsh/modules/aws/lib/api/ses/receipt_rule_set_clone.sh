aws_ses_receipt_rule_set_clone() {
    local rule_set_name="$1"
    local original_rule_set_name="$2"
    shift 2

    cond_log_and_run aws ses clone-receipt-rule-set --rule-set-name $rule_set_name --original-rule-set-name $original_rule_set_name "$@"
}
