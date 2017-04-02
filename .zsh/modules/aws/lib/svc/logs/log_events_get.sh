aws_logs_log_events_get() {
    local log-stream-name="$1"
    local log-group-name="$2"
    shift 2

    log_and_run aws logs  --log-stream-name $log_stream_name --log-group-name $log_group_name "@"

}
