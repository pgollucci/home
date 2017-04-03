aws_logs_export_tasks_describe() {
    shift 0

    log_and_run aws logs describe-export-tasks "$@"
}
