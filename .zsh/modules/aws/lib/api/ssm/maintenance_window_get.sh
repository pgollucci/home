aws_ssm_maintenance_window_get() {
    local window_id="$1"
    shift 1

    log_and_run aws ssm get-maintenance-window --window-id $window_id "$@"
}
