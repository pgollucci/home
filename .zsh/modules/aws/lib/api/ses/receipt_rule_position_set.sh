aws_ses_receipt_rule_position_set() {
    local rule_set_name="$1"
    local rule_name="$2"
    shift 2

    cond_log_and_run aws ses set-receipt-rule-position --rule-set-name $rule_set_name --rule-name $rule_name "$@"
}
