aws_ec2_flow_logs_create() {
    local resource_ids="$1"
    local resource_type="$2"
    local traffic_type="$3"
    local log_group_name="$4"
    local deliver_logs_permission_arn="$5"
    shift 5

    cond_log_and_run aws ec2 create-flow-logs --resource-ids $resource_ids --resource-type $resource_type --traffic-type $traffic_type --log-group-name $log_group_name --deliver-logs-permission-arn $deliver_logs_permission_arn "$@"
}
