aws_elbv2_rule_delete() {
    local rule-arn="$1"
    shift 1

    cond_log_and_run aws elbv2  --rule-arn $rule_arn "@"

}
