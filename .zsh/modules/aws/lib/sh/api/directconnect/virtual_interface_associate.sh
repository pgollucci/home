aws_directconnect_virtual_interface_associate() {
    local virtual_interface_id="$1"
    local connection_id="$2"
    shift 2

    cond_log_and_run aws directconnect associate-virtual-interface --virtual-interface-id $virtual_interface_id --connection-id $connection_id "$@"
}
