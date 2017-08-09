aws_ec2_network_interface_permission_delete() {
    local network_interface_permission_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-network-interface-permission --network-interface-permission-id $network_interface_permission_id "$@"
}
