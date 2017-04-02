aws_ec2_route_delete() {
    local route-table-id="$1"
    shift 1

    cond_log_and_run aws ec2  --route-table-id $route_table_id "@"

}
