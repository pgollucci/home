aws_directconnect_public_virtual_interface_create() {
    local connection_id="$1"
    local new_public_virtual_interface="$2"
    shift 2

    cond_log_and_run aws directconnect create-public-virtual-interface --connection-id $connection_id --new-public-virtual-interface $new_public_virtual_interface "$@"
}
