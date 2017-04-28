aws_logs_metric_filter_test() {
    local filter_pattern="$1"
    local log_event_messages="$2"
    shift 2

    cond_log_and_run aws logs test-metric-filter --filter-pattern $filter_pattern --log-event-messages $log_event_messages "$@"
}
