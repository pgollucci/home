aws_swf_activity_task_canceled_respond() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws swf respond-activity-task-canceled --task-token $task_token "$@"
}
