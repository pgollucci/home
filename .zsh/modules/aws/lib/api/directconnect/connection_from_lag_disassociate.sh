aws_directconnect_connection_from_lag_disassociate() {
    local connection_id="$1"
    local lag_id="$2"
    shift 2

    cond_log_and_run aws directconnect disassociate-connection-from-lag --connection-id $connection_id --lag-id $lag_id "$@"
}
