aws_directconnect_public_virtual_interface_allocate() {
    local connection-id="$1"
    local new-public-virtual-interface-allocation="$2"
    local owner-account="$3"
    shift 3

    cond_log_and_run aws directconnect  --connection-id $connection_id --new-public-virtual-interface-allocation $new_public_virtual_interface_allocation --owner-account $owner_account "@"

}
