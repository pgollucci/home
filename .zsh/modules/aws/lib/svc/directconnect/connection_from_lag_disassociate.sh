aws_directconnect_connection_from_lag_disassociate() {
    local lag-id="$1"
    local connection-id="$2"
    shift 2

    cond_log_and_run aws directconnect  --lag-id $lag_id --connection-id $connection_id "@"

}
