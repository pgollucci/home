aws_directconnect_lag_update() {
    local lag_id="$1"
    shift 1

    cond_log_and_run aws directconnect update-lag --lag-id $lag_id "$@"
}
