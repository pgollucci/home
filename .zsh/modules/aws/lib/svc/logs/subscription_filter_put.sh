aws_logs_subscription_filter_put() {
    local destination-arn="$1"
    local filter-name="$2"
    local filter-pattern="$3"
    local log-group-name="$4"
    shift 4

    cond_log_and_run aws logs  --destination-arn $destination_arn --filter-name $filter_name --filter-pattern $filter_pattern --log-group-name $log_group_name "@"

}
