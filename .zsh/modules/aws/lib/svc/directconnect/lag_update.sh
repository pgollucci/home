aws_directconnect_lag_update() {
    local lag-id="$1"
    shift 1

    cond_log_and_run aws directconnect  --lag-id $lag_id "@"

}
