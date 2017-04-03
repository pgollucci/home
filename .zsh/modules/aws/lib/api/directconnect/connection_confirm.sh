aws_directconnect_connection_confirm() {
    local connection_id="$1"
    shift 1

    cond_log_and_run aws directconnect confirm-connection --connection-id $connection_id "$@"
}
