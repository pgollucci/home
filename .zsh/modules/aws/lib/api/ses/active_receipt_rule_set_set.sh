aws_ses_active_receipt_rule_set_set() {
    shift 0

    cond_log_and_run aws ses set-active-receipt-rule-set "$@"
}
