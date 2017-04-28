aws_elbv2_rule_modify() {
    local rule_arn="$1"
    shift 1

    cond_log_and_run aws elbv2 modify-rule --rule-arn $rule_arn "$@"
}
