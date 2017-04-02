aws_ses_receipt_rule_set_reorder() {
    local rule-set-name="$1"
    local rule-names="$2"
    shift 2

    cond_log_and_run aws ses  --rule-set-name $rule_set_name --rule-names $rule_names "@"

}
