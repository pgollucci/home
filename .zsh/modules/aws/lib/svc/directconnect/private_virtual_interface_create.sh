aws_directconnect_private_virtual_interface_create() {
    local connection-id="$1"
    local new-private-virtual-interface="$2"
    shift 2

    cond_log_and_run aws directconnect  --connection-id $connection_id --new-private-virtual-interface $new_private_virtual_interface "@"

}
