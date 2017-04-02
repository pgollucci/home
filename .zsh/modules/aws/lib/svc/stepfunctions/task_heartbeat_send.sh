aws_stepfunctions_task_heartbeat_send() {
    local task-token="$1"
    shift 1

    cond_log_and_run aws stepfunctions  --task-token $task_token "@"

}
