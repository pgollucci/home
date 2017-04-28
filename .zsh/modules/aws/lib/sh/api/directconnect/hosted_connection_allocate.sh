aws_directconnect_hosted_connection_allocate() {
    local connection_id="$1"
    local owner_account="$2"
    local bandwidth="$3"
    local connection_name="$4"
    local vlan="$5"
    shift 5

    cond_log_and_run aws directconnect allocate-hosted-connection --connection-id $connection_id --owner-account $owner_account --bandwidth $bandwidth --connection-name $connection_name --vlan $vlan "$@"
}
