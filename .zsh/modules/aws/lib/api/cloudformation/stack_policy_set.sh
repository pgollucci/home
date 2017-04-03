aws_cloudformation_stack_policy_set() {
    local stack_name="$1"
    shift 1

    cond_log_and_run aws cloudformation set-stack-policy --stack-name $stack_name "$@"
}
