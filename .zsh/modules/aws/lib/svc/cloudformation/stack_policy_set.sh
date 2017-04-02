aws_cloudformation_stack_policy_set() {
    local stack-name="$1"
    shift 1

    cond_log_and_run aws cloudformation  --stack-name $stack_name "@"

}
