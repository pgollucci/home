aws_cloudformation_stack_set_operations_list() {
    local stack_set_name="$1"
    shift 1

    log_and_run aws cloudformation list-stack-set-operations --stack-set-name $stack_set_name "$@"
}
