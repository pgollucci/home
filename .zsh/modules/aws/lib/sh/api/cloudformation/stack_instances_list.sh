aws_cloudformation_stack_instances_list() {
    local stack_set_name="$1"
    shift 1

    log_and_run aws cloudformation list-stack-instances --stack-set-name $stack_set_name "$@"
}
