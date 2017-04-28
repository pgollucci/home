aws_ec2_import_task_cancel() {

    cond_log_and_run aws ec2 cancel-import-task "$@"
}
