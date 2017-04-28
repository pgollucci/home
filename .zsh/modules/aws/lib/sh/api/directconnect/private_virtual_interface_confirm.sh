aws_directconnect_private_virtual_interface_confirm() {
    local virtual_interface_id="$1"
    local virtual_gateway_id="$2"
    shift 2

    cond_log_and_run aws directconnect confirm-private-virtual-interface --virtual-interface-id $virtual_interface_id --virtual-gateway-id $virtual_gateway_id "$@"
}
