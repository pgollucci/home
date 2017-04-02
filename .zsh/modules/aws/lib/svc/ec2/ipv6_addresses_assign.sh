aws_ec2_ipv6_addresses_assign() {
    local network-interface-id="$1"
    shift 1

    cond_log_and_run aws ec2  --network-interface-id $network_interface_id "@"

}
