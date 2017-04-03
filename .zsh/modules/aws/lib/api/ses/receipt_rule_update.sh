aws_ses_receipt_rule_update() {
    local rule_set_name="$1"
    local rule="$2"
    shift 2

    cond_log_and_run aws ses update-receipt-rule --rule-set-name $rule_set_name --rule $rule "$@"
}
