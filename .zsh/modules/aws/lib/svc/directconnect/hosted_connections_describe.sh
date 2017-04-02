aws_directconnect_hosted_connections_describe() {
    local connection-id="$1"
    shift 1

    log_and_run aws directconnect  --connection-id $connection_id "@"

}
