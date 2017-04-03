aws_dms_table_statistics_describe() {
    local replication_task_arn="$1"
    shift 1

    log_and_run aws dms describe-table-statistics --replication-task-arn $replication_task_arn "$@"
}
