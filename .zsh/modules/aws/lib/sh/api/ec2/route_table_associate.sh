aws_ec2_route_table_associate() {
    local route_table_id="$1"
    local subnet_id="$2"
    shift 2

    cond_log_and_run aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $subnet_id "$@"
}
