aws_ec2_vpn_connection_route_delete() {
    local destination-cidr-block="$1"
    local vpn-connection-id="$2"
    shift 2

    cond_log_and_run aws ec2  --destination-cidr-block $destination_cidr_block --vpn-connection-id $vpn_connection_id "@"

}
