aws_ses_receipt_rule_set_create() {
    local rule_set_name="$1"
    shift 1

    cond_log_and_run aws ses create-receipt-rule-set --rule-set-name $rule_set_name "$@"
}
