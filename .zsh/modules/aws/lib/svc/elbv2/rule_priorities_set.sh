aws_elbv2_rule_priorities_set() {
    local rule-priorities="$1"
    shift 1

    cond_log_and_run aws elbv2  --rule-priorities $rule_priorities "@"

}
