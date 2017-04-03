aws_swf_activity_task_completed_respond() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws swf respond-activity-task-completed --task-token $task_token "$@"
}
