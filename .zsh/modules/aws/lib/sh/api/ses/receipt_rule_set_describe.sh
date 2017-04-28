aws_ses_receipt_rule_set_describe() {
    local rule_set_name="$1"
    shift 1

    log_and_run aws ses describe-receipt-rule-set --rule-set-name $rule_set_name "$@"
}
