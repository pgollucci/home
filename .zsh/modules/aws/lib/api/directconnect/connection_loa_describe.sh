aws_directconnect_connection_loa_describe() {
    local connection_id="$1"
    shift 1

    log_and_run aws directconnect describe-connection-loa --connection-id $connection_id "$@"
}
