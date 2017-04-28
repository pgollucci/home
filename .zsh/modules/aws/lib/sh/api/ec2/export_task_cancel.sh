aws_ec2_export_task_cancel() {
    local export_task_id="$1"
    shift 1

    cond_log_and_run aws ec2 cancel-export-task --export-task-id $export_task_id "$@"
}
