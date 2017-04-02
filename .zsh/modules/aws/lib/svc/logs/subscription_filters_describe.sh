aws_logs_subscription_filters_describe() {
    local log-group-name="$1"
    shift 1

    log_and_run aws logs  --log-group-name $log_group_name "@"

}
