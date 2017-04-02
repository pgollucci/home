aws_ec2_flow_logs_create() {
    local traffic-type="$1"
    local deliver-logs-permission-arn="$2"
    local resource-type="$3"
    local resource-ids="$4"
    local log-group-name="$5"
    shift 5

    cond_log_and_run aws ec2  --traffic-type $traffic_type --deliver-logs-permission-arn $deliver_logs_permission_arn --resource-type $resource_type --resource-ids $resource_ids --log-group-name $log_group_name "@"

}
