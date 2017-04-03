aws_ec2_vpn_connection_route_delete() {
    local vpn_connection_id="$1"
    local destination_cidr_block="$2"
    shift 2

    cond_log_and_run aws ec2 delete-vpn-connection-route --vpn-connection-id $vpn_connection_id --destination-cidr-block $destination_cidr_block "$@"
}
