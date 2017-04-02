aws_directconnect_hosted_connection_allocate() {
    local connection-id="$1"
    local bandwidth="$2"
    local vlan="$3"
    local connection-name="$4"
    local owner-account="$5"
    shift 5

    cond_log_and_run aws directconnect  --connection-id $connection_id --bandwidth $bandwidth --vlan $vlan --connection-name $connection_name --owner-account $owner_account "@"

}
