aws_ec2_network_interface_delete() {
    local network_interface_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-network-interface --network-interface-id $network_interface_id "$@"
}
