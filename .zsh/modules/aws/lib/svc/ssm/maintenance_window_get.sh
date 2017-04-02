aws_ssm_maintenance_window_get() {
    local window-id="$1"
    shift 1

    log_and_run aws ssm  --window-id $window_id "@"

}
