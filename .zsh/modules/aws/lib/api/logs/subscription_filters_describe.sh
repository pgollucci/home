aws_logs_subscription_filters_describe() {
    local log_group_name="$1"
    shift 1

    log_and_run aws logs describe-subscription-filters --log-group-name $log_group_name "$@"
}
