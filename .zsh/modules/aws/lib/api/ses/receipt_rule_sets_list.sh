aws_ses_receipt_rule_sets_list() {
    shift 0

    log_and_run aws ses list-receipt-rule-sets "$@"
}
