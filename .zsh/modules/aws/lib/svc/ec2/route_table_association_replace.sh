aws_ec2_route_table_association_replace() {
    local route-table-id="$1"
    local association-id="$2"
    shift 2

    cond_log_and_run aws ec2  --route-table-id $route_table_id --association-id $association_id "@"

}
