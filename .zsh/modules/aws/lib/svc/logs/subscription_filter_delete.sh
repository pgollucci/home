aws_logs_subscription_filter_delete() {
    local filter-name="$1"
    local log-group-name="$2"
    shift 2

    cond_log_and_run aws logs  --filter-name $filter_name --log-group-name $log_group_name "@"

}
