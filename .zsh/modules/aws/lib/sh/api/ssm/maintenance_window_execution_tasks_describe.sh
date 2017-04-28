aws_ssm_maintenance_window_execution_tasks_describe() {
    local window_execution_id="$1"
    shift 1

    log_and_run aws ssm describe-maintenance-window-execution-tasks --window-execution-id $window_execution_id "$@"
}
