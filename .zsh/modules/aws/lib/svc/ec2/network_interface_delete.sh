aws_ec2_network_interface_delete() {
    local network-interface-id="$1"
    shift 1

    cond_log_and_run aws ec2  --network-interface-id $network_interface_id "@"

}
