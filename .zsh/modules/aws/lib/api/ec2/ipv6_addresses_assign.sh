aws_ec2_ipv6_addresses_assign() {
    local network_interface_id="$1"
    shift 1

    cond_log_and_run aws ec2 assign-ipv6-addresses --network-interface-id $network_interface_id "$@"
}
