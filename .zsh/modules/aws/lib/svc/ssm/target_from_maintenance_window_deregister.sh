aws_ssm_target_from_maintenance_window_deregister() {
    local window-id="$1"
    local window-target-id="$2"
    shift 2

    log_and_run aws ssm  --window-id $window_id --window-target-id $window_target_id "@"

}
