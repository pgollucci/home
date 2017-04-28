aws_cloudformation_stack_create() {
    local stack_name="$1"
    shift 1

    cond_log_and_run aws cloudformation create-stack --stack-name $stack_name "$@"
}
