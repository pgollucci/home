aws_ssm_task_with_maintenance_window_register() {
    local window_id="$1"
    local targets="$2"
    local task_arn="$3"
    local service_role_arn="$4"
    local task_type="$5"
    local max_concurrency="$6"
    local max_errors="$7"
    shift 7

    cond_log_and_run aws ssm register-task-with-maintenance-window --window-id $window_id --targets $targets --task-arn $task_arn --service-role-arn $service_role_arn --task-type $task_type --max-concurrency $max_concurrency --max-errors $max_errors "$@"
}
