aws_directconnect_private_virtual_interface_allocate() {
    local connection_id="$1"
    local owner_account="$2"
    local new_private_virtual_interface_allocation="$3"
    shift 3

    cond_log_and_run aws directconnect allocate-private-virtual-interface --connection-id $connection_id --owner-account $owner_account --new-private-virtual-interface-allocation $new_private_virtual_interface_allocation "$@"
}
