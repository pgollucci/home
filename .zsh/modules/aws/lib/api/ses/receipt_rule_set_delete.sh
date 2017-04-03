aws_ses_receipt_rule_set_delete() {
    local rule_set_name="$1"
    shift 1

    cond_log_and_run aws ses delete-receipt-rule-set --rule-set-name $rule_set_name "$@"
}
