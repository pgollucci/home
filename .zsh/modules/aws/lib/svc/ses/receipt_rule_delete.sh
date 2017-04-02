aws_ses_receipt_rule_delete() {
    local rule-set-name="$1"
    local rule-name="$2"
    shift 2

    cond_log_and_run aws ses  --rule-set-name $rule_set_name --rule-name $rule_name "@"

}
