aws_dms_tables_reload() {
    local replication_task_arn="$1"
    local tables_to_reload="$2"
    shift 2

    cond_log_and_run aws dms reload-tables --replication-task-arn $replication_task_arn --tables-to-reload $tables_to_reload "$@"
}
