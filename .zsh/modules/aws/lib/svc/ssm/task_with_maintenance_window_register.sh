aws_ssm_task_with_maintenance_window_register() {
    local task-type="$1"
    local service-role-arn="$2"
    local max-concurrency="$3"
    local window-id="$4"
    local task-arn="$5"
    local targets="$6"
    local max-errors="$7"
    shift 7

    cond_log_and_run aws ssm  --task-type $task_type --service-role-arn $service_role_arn --max-concurrency $max_concurrency --window-id $window_id --task-arn $task_arn --targets $targets --max-errors $max_errors "@"

}
