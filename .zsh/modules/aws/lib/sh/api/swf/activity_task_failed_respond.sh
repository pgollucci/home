aws_swf_activity_task_failed_respond() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws swf respond-activity-task-failed --task-token $task_token "$@"
}
