aws_dms_replication_task_stop() {
    local replication_task_arn="$1"
    shift 1

    cond_log_and_run aws dms stop-replication-task --replication-task-arn $replication_task_arn "$@"
}
