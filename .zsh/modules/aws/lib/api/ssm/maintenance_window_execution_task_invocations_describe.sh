aws_ssm_maintenance_window_execution_task_invocations_describe() {
    local window_execution_id="$1"
    local task_id="$2"
    shift 2

    log_and_run aws ssm describe-maintenance-window-execution-task-invocations --window-execution-id $window_execution_id --task-id $task_id "$@"
}
