aws_directconnect_public_virtual_interface_confirm() {
    local virtual-interface-id="$1"
    shift 1

    cond_log_and_run aws directconnect  --virtual-interface-id $virtual_interface_id "@"

}
