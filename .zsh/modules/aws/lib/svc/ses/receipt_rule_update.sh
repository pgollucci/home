aws_ses_receipt_rule_update() {
    local rule="$1"
    local rule-set-name="$2"
    shift 2

    cond_log_and_run aws ses  --rule $rule --rule-set-name $rule_set_name "@"

}
