aws_ec2_vgw_route_propagation_enable() {
    local route_table_id="$1"
    local gateway_id="$2"
    shift 2

    cond_log_and_run aws ec2 enable-vgw-route-propagation --route-table-id $route_table_id --gateway-id $gateway_id "$@"
}
