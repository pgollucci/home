aws_logs_export_task_cancel() {
    local task_id="$1"
    shift 1

    cond_log_and_run aws logs cancel-export-task --task-id $task_id "$@"
}
