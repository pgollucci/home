aws_ec2_route_table_association_replace() {
    local association_id="$1"
    local route_table_id="$2"
    shift 2

    cond_log_and_run aws ec2 replace-route-table-association --association-id $association_id --route-table-id $route_table_id "$@"
}
