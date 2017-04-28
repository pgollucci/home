aws_ec2_network_interface_attribute_describe() {
    local network_interface_id="$1"
    shift 1

    log_and_run aws ec2 describe-network-interface-attribute --network-interface-id $network_interface_id "$@"
}
