aws_cloudformation_stack_resource_describe() {
    local stack-name="$1"
    local logical-resource-id="$2"
    shift 2

    log_and_run aws cloudformation  --stack-name $stack_name --logical-resource-id $logical_resource_id "@"

}
