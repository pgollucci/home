aws_directconnect_private_virtual_interface_create() {
    local connection_id="$1"
    local new_private_virtual_interface="$2"
    shift 2

    cond_log_and_run aws directconnect create-private-virtual-interface --connection-id $connection_id --new-private-virtual-interface $new_private_virtual_interface "$@"
}
