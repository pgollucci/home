aws_directconnect_connection_on_interconnect_allocate() {
    local bandwidth="$1"
    local interconnect-id="$2"
    local vlan="$3"
    local connection-name="$4"
    local owner-account="$5"
    shift 5

    cond_log_and_run aws directconnect  --bandwidth $bandwidth --interconnect-id $interconnect_id --vlan $vlan --connection-name $connection_name --owner-account $owner_account "@"

}
