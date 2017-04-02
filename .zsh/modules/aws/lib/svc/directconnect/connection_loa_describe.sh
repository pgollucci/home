aws_directconnect_connection_loa_describe() {
    local connection-id="$1"
    shift 1

    log_and_run aws directconnect  --connection-id $connection_id "@"

}
