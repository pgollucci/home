aws_directconnect_virtual_interface_delete() {
    local virtual_interface_id="$1"
    shift 1

    cond_log_and_run aws directconnect delete-virtual-interface --virtual-interface-id $virtual_interface_id "$@"
}
