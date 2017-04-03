aws_ses_receipt_rule_describe() {
    local rule_set_name="$1"
    local rule_name="$2"
    shift 2

    log_and_run aws ses describe-receipt-rule --rule-set-name $rule_set_name --rule-name $rule_name "$@"
}
