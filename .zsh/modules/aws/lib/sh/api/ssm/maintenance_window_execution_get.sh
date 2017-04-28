aws_ssm_maintenance_window_execution_get() {
    local window_execution_id="$1"
    shift 1

    log_and_run aws ssm get-maintenance-window-execution --window-execution-id $window_execution_id "$@"
}
