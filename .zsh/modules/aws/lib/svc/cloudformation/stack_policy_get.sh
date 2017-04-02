aws_cloudformation_stack_policy_get() {
    local stack-name="$1"
    shift 1

    log_and_run aws cloudformation  --stack-name $stack_name "@"

}
