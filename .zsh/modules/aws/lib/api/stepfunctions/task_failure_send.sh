aws_stepfunctions_task_failure_send() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws stepfunctions send-task-failure --task-token $task_token "$@"
}
