aws_cloudformation_stack_resources_list() {
    local stack_name="$1"
    shift 1

    log_and_run aws cloudformation list-stack-resources --stack-name $stack_name "$@"
}
