aws_ses_receipt_rule_position_set() {
    local rule-name="$1"
    local rule-set-name="$2"
    shift 2

    cond_log_and_run aws ses  --rule-name $rule_name --rule-set-name $rule_set_name "@"

}
