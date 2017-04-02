aws_swf_activity_task_completed_respond() {
    local task-token="$1"
    shift 1

    cond_log_and_run aws swf  --task-token $task_token "@"

}
