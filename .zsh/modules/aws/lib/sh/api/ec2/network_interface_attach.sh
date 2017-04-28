aws_ec2_network_interface_attach() {
    local network_interface_id="$1"
    local instance_id="$2"
    local device_index="$3"
    shift 3

    cond_log_and_run aws ec2 attach-network-interface --network-interface-id $network_interface_id --instance-id $instance_id --device-index $device_index "$@"
}
