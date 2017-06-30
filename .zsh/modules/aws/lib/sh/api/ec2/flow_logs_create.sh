aws_ec2_flow_logs_create() {
    local deliver_logs_permission_arn="$1"
    local log_group_name="$2"
    local resource_ids="$3"
    local resource_type="$4"
    local traffic_type="$5"
    shift 5

    cond_log_and_run aws ec2 create-flow-logs --deliver-logs-permission-arn $deliver_logs_permission_arn --log-group-name $log_group_name --resource-ids $resource_ids --resource-type $resource_type --traffic-type $traffic_type "$@"
}
