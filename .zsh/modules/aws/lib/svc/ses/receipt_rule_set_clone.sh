aws_ses_receipt_rule_set_clone() {
    local original-rule-set-name="$1"
    local rule-set-name="$2"
    shift 2

    cond_log_and_run aws ses  --original-rule-set-name $original_rule_set_name --rule-set-name $rule_set_name "@"

}
