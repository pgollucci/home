aws_logs_log_events_put() {
    local log-group-name="$1"
    local log-events="$2"
    local log-stream-name="$3"
    shift 3

    cond_log_and_run aws logs  --log-group-name $log_group_name --log-events $log_events --log-stream-name $log_stream_name "@"

}
