aws_ec2_export_tasks_describe() {
    shift 0

    log_and_run aws ec2 describe-export-tasks "$@"
}
