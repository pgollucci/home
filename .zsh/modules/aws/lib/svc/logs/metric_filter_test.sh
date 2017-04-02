aws_logs_metric_filter_test() {
    local log-event-messages="$1"
    local filter-pattern="$2"
    shift 2

    cond_log_and_run aws logs  --log-event-messages $log_event_messages --filter-pattern $filter_pattern "@"

}
