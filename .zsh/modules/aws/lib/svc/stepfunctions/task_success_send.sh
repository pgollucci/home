aws_stepfunctions_task_success_send() {
    local task-output="$1"
    local task-token="$2"
    shift 2

    cond_log_and_run aws stepfunctions  --task-output $task_output --task-token $task_token "@"

}
