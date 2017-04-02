aws_directconnect_virtual_interface_associate() {
    local virtual-interface-id="$1"
    local connection-id="$2"
    shift 2

    cond_log_and_run aws directconnect  --virtual-interface-id $virtual_interface_id --connection-id $connection_id "@"

}
