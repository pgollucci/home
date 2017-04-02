aws_ssm_maintenance_window_delete() {
    local window-id="$1"
    shift 1

    cond_log_and_run aws ssm  --window-id $window_id "@"

}
