aws_elbv2_rule_delete() {
    local rule_arn="$1"
    shift 1

    cond_log_and_run aws elbv2 delete-rule --rule-arn $rule_arn "$@"
}
