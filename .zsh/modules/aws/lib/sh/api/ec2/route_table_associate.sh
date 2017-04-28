aws_ec2_route_table_associate() {
    local subnet_id="$1"
    local route_table_id="$2"
    shift 2

    cond_log_and_run aws ec2 associate-route-table --subnet-id $subnet_id --route-table-id $route_table_id "$@"
}
