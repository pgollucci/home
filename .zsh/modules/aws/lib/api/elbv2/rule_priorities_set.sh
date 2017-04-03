aws_elbv2_rule_priorities_set() {
    local rule_priorities="$1"
    shift 1

    cond_log_and_run aws elbv2 set-rule-priorities --rule-priorities $rule_priorities "$@"
}
