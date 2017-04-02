aws_ec2_vgw_route_propagation_disable() {
    local route-table-id="$1"
    local gateway-id="$2"
    shift 2

    cond_log_and_run aws ec2  --route-table-id $route_table_id --gateway-id $gateway_id "@"

}
