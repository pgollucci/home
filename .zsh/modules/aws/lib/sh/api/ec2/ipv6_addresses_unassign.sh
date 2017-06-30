aws_ec2_ipv6_addresses_unassign() {
    local ipv6_addresses="$1"
    local network_interface_id="$2"
    shift 2

    cond_log_and_run aws ec2 unassign-ipv6-addresses --ipv6-addresses $ipv6_addresses --network-interface-id $network_interface_id "$@"
}
