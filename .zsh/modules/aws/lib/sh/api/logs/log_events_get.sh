aws_logs_log_events_get() {
    local log_group_name="$1"
    local log_stream_name="$2"
    shift 2

    log_and_run aws logs get-log-events --log-group-name $log_group_name --log-stream-name $log_stream_name "$@"
}
