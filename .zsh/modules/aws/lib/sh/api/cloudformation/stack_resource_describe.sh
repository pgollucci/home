aws_cloudformation_stack_resource_describe() {
    local stack_name="$1"
    local logical_resource_id="$2"
    shift 2

    log_and_run aws cloudformation describe-stack-resource --stack-name $stack_name --logical-resource-id $logical_resource_id "$@"
}
