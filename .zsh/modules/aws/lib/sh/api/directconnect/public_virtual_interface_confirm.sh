aws_directconnect_public_virtual_interface_confirm() {
    local virtual_interface_id="$1"
    shift 1

    cond_log_and_run aws directconnect confirm-public-virtual-interface --virtual-interface-id $virtual_interface_id "$@"
}
