aws_ssm_task_from_maintenance_window_deregister() {
    local window-task-id="$1"
    local window-id="$2"
    shift 2

    cond_log_and_run aws ssm  --window-task-id $window_task_id --window-id $window_id "@"

}
