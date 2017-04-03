aws_datapipeline_task_status_set() {
    local task_id="$1"
    local task_status="$2"
    shift 2

    cond_log_and_run aws datapipeline set-task-status --task-id $task_id --task-status $task_status "$@"
}
