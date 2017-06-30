aws_ec2_vpn_connection_route_create() {
    local destination_cidr_block="$1"
    local vpn_connection_id="$2"
    shift 2

    cond_log_and_run aws ec2 create-vpn-connection-route --destination-cidr-block $destination_cidr_block --vpn-connection-id $vpn_connection_id "$@"
}
