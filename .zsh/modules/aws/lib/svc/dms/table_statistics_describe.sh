aws_dms_table_statistics_describe() {
    local replication-task-arn="$1"
    shift 1

    log_and_run aws dms  --replication-task-arn $replication_task_arn "@"

}
