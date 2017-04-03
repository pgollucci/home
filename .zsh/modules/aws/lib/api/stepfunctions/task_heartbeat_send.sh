aws_stepfunctions_task_heartbeat_send() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws stepfunctions send-task-heartbeat --task-token $task_token "$@"
}
