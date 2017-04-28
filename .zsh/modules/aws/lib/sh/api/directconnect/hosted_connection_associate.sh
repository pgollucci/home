aws_directconnect_hosted_connection_associate() {
    local connection_id="$1"
    local parent_connection_id="$2"
    shift 2

    cond_log_and_run aws directconnect associate-hosted-connection --connection-id $connection_id --parent-connection-id $parent_connection_id "$@"
}
