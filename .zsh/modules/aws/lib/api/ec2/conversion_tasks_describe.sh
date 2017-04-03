aws_ec2_conversion_tasks_describe() {
    shift 0

    log_and_run aws ec2 describe-conversion-tasks "$@"
}
