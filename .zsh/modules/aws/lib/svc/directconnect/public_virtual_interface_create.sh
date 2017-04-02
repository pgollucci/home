aws_directconnect_public_virtual_interface_create() {
    local new-public-virtual-interface="$1"
    local connection-id="$2"
    shift 2

    cond_log_and_run aws directconnect  --new-public-virtual-interface $new_public_virtual_interface --connection-id $connection_id "@"

}
