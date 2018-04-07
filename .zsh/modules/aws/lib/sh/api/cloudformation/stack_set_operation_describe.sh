aws_cloudformation_stack_set_operation_describe() {
    local stack_set_name="$1"
    local operation_id="$2"
    shift 2

    log_and_run aws cloudformation describe-stack-set-operation --stack-set-name $stack_set_name --operation-id $operation_id "$@"
}
