aws_ec2_network_interface_attach() {
    local device-index="$1"
    local network-interface-id="$2"
    local instance-id="$3"
    shift 3

    cond_log_and_run aws ec2  --device-index $device_index --network-interface-id $network_interface_id --instance-id $instance_id "@"

}
