aws_logs_log_group_delete() {
    local log_group_name="$1"
    shift 1

    cond_log_and_run aws logs delete-log-group --log-group-name $log_group_name "$@"
}
