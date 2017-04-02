aws_cloudformation_resource_signal() {
    local stack-name="$1"
    local status="$2"
    local logical-resource-id="$3"
    local unique-id="$4"
    shift 4

    cond_log_and_run aws cloudformation  --stack-name $stack_name --status $status --logical-resource-id $logical_resource_id --unique-id $unique_id "@"

}
