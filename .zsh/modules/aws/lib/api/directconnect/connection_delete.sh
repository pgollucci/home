aws_directconnect_connection_delete() {
    local connection_id="$1"
    shift 1

    cond_log_and_run aws directconnect delete-connection --connection-id $connection_id "$@"
}
