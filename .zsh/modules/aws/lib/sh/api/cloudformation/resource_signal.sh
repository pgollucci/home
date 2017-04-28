aws_cloudformation_resource_signal() {
    local stack_name="$1"
    local logical_resource_id="$2"
    local unique_id="$3"
    local status="$4"
    shift 4

    cond_log_and_run aws cloudformation signal-resource --stack-name $stack_name --logical-resource-id $logical_resource_id --unique-id $unique_id --status $status "$@"
}
