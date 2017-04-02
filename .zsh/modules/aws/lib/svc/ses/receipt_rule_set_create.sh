aws_ses_receipt_rule_set_create() {
    local rule-set-name="$1"
    shift 1

    cond_log_and_run aws ses  --rule-set-name $rule_set_name "@"

}
