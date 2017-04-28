aws_ses_receipt_rule_set_reorder() {
    local rule_set_name="$1"
    local rule_names="$2"
    shift 2

    cond_log_and_run aws ses reorder-receipt-rule-set --rule-set-name $rule_set_name --rule-names $rule_names "$@"
}
