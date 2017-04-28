aws_swf_activity_task_heartbeat_record() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws swf record-activity-task-heartbeat --task-token $task_token "$@"
}
