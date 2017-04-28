aws_logs_metric_filter_put() {
    local log_group_name="$1"
    local filter_name="$2"
    local filter_pattern="$3"
    local metric_transformations="$4"
    shift 4

    cond_log_and_run aws logs put-metric-filter --log-group-name $log_group_name --filter-name $filter_name --filter-pattern $filter_pattern --metric-transformations $metric_transformations "$@"
}
