aws_ec2_import_task_cancel() {
    shift 0

    cond_log_and_run aws ec2  "@"

}
