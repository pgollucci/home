aws_datapipeline_task_progress_report() {
    local task-id="$1"
    shift 1

    cond_log_and_run aws datapipeline  --task-id $task_id "@"

}
