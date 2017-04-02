aws_directconnect_private_virtual_interface_allocate() {
    local new-private-virtual-interface-allocation="$1"
    local owner-account="$2"
    local connection-id="$3"
    shift 3

    cond_log_and_run aws directconnect  --new-private-virtual-interface-allocation $new_private_virtual_interface_allocation --owner-account $owner_account --connection-id $connection_id "@"

}
