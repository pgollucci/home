aws_cloudformation_stack_policy_get() {
    local stack_name="$1"
    shift 1

    log_and_run aws cloudformation get-stack-policy --stack-name $stack_name "$@"
}
