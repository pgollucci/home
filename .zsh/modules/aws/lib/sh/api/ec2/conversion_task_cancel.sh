aws_ec2_conversion_task_cancel() {
    local conversion_task_id="$1"
    shift 1

    cond_log_and_run aws ec2 cancel-conversion-task --conversion-task-id $conversion_task_id "$@"
}
