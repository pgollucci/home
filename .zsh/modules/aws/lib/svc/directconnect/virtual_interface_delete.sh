aws_directconnect_virtual_interface_delete() {
    local virtual-interface-id="$1"
    shift 1

    cond_log_and_run aws directconnect  --virtual-interface-id $virtual_interface_id "@"

}
