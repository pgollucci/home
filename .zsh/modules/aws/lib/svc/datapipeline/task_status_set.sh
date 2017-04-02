aws_datapipeline_task_status_set() {
    local task-id="$1"
    local task-status="$2"
    shift 2

    cond_log_and_run aws datapipeline  --task-id $task_id --task-status $task_status "@"

}
