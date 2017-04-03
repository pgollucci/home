aws_ec2_route_table_disassociate() {
    local association_id="$1"
    shift 1

    cond_log_and_run aws ec2 disassociate-route-table --association-id $association_id "$@"
}
