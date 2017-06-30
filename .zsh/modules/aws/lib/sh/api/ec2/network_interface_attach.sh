aws_ec2_network_interface_attach() {
    local device_index="$1"
    local instance_id="$2"
    local network_interface_id="$3"
    shift 3

    cond_log_and_run aws ec2 attach-network-interface --device-index $device_index --instance-id $instance_id --network-interface-id $network_interface_id "$@"
}
