aws_directconnect_private_virtual_interface_confirm() {
    local virtual-gateway-id="$1"
    local virtual-interface-id="$2"
    shift 2

    cond_log_and_run aws directconnect  --virtual-gateway-id $virtual_gateway_id --virtual-interface-id $virtual_interface_id "@"

}
