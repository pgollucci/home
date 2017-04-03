aws_logs_metric_filter_delete() {
    local log_group_name="$1"
    local filter_name="$2"
    shift 2

    cond_log_and_run aws logs delete-metric-filter --log-group-name $log_group_name --filter-name $filter_name "$@"
}
