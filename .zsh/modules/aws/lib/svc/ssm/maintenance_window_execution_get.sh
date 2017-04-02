aws_ssm_maintenance_window_execution_get() {
    local window-execution-id="$1"
    shift 1

    log_and_run aws ssm  --window-execution-id $window_execution_id "@"

}
