aws_dms_replication_tasks_describe() {
    shift 0

    log_and_run aws dms describe-replication-tasks "$@"
}
