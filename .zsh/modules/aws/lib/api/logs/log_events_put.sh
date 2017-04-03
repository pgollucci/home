aws_logs_log_events_put() {
    local log_group_name="$1"
    local log_stream_name="$2"
    local log_events="$3"
    shift 3

    cond_log_and_run aws logs put-log-events --log-group-name $log_group_name --log-stream-name $log_stream_name --log-events $log_events "$@"
}
