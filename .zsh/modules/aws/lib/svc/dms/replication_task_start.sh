aws_dms_replication_task_start() {
    local replication-task-arn="$1"
    shift 1

    cond_log_and_run aws dms  --replication-task-arn $replication_task_arn "@"

}
