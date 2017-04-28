aws_dms_replication_task_delete() {
    local replication_task_arn="$1"
    shift 1

    cond_log_and_run aws dms delete-replication-task --replication-task-arn $replication_task_arn "$@"
}
