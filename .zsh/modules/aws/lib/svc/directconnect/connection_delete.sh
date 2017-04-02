aws_directconnect_connection_delete() {
    local connection-id="$1"
    shift 1

    cond_log_and_run aws directconnect  --connection-id $connection_id "@"

}
