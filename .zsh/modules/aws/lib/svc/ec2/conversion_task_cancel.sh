aws_ec2_conversion_task_cancel() {
    local conversion-task-id="$1"
    shift 1

    cond_log_and_run aws ec2  --conversion-task-id $conversion_task_id "@"

}
