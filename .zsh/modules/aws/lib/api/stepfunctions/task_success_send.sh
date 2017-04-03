aws_stepfunctions_task_success_send() {
    local task_token="$1"
    local task_output="$2"
    shift 2

    cond_log_and_run aws stepfunctions send-task-success --task-token $task_token --task-output $task_output "$@"
}
