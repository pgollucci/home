aws_cloudformation_stack_set_describe() {
    local stack_set_name="$1"
    shift 1

    log_and_run aws cloudformation describe-stack-set --stack-set-name $stack_set_name "$@"
}
