aws_directconnect_connection_on_interconnect_allocate() {
    local bandwidth="$1"
    local connection_name="$2"
    local owner_account="$3"
    local interconnect_id="$4"
    local vlan="$5"
    shift 5

    cond_log_and_run aws directconnect allocate-connection-on-interconnect --bandwidth $bandwidth --connection-name $connection_name --owner-account $owner_account --interconnect-id $interconnect_id --vlan $vlan "$@"
}
