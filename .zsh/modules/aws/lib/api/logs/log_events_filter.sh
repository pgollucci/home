aws_logs_log_events_filter() {
    local log_group_name="$1"
    shift 1

    cond_log_and_run aws logs filter-log-events --log-group-name $log_group_name "$@"
}
