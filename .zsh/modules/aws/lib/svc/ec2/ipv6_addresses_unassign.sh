aws_ec2_ipv6_addresses_unassign() {
    local network-interface-id="$1"
    local ipv6-addresses="$2"
    shift 2

    cond_log_and_run aws ec2  --network-interface-id $network_interface_id --ipv6-addresses $ipv6_addresses "@"

}
