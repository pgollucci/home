aws_ses_active_receipt_rule_set_describe() {
    shift 0

    log_and_run aws ses describe-active-receipt-rule-set "$@"
}
