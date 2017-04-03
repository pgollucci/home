aws_ec2_private_ip_addresses_assign() {
    local network_interface_id="$1"
    shift 1

    cond_log_and_run aws ec2 assign-private-ip-addresses --network-interface-id $network_interface_id "$@"
}
