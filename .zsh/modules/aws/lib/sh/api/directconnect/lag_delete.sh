aws_directconnect_lag_delete() {
    local lag_id="$1"
    shift 1

    cond_log_and_run aws directconnect delete-lag --lag-id $lag_id "$@"
}
