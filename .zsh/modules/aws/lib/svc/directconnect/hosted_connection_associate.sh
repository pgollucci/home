aws_directconnect_hosted_connection_associate() {
    local connection-id="$1"
    local parent-connection-id="$2"
    shift 2

    cond_log_and_run aws directconnect  --connection-id $connection_id --parent-connection-id $parent_connection_id "@"

}
