aws_directconnect_connection_with_lag_associate() {
    local connection_id="$1"
    local lag_id="$2"
    shift 2

    cond_log_and_run aws directconnect associate-connection-with-lag --connection-id $connection_id --lag-id $lag_id "$@"
}
