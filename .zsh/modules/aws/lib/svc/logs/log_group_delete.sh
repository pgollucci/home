aws_logs_log_group_delete() {
    local log-group-name="$1"
    shift 1

    cond_log_and_run aws logs  --log-group-name $log_group_name "@"

}
