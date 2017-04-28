aws_ec2_network_interface_attribute_reset() {
    local network_interface_id="$1"
    shift 1

    cond_log_and_run aws ec2 reset-network-interface-attribute --network-interface-id $network_interface_id "$@"
}
