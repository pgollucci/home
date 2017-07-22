aws_ec2_network_interface_permission_create() {
    local network_interface_id="$1"
    local permission="$2"
    shift 2

    cond_log_and_run aws ec2 create-network-interface-permission --network-interface-id $network_interface_id --permission $permission "$@"
}
