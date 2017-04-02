aws_logs_log_stream_delete() {
    local log-stream-name="$1"
    local log-group-name="$2"
    shift 2

    cond_log_and_run aws logs  --log-stream-name $log_stream_name --log-group-name $log_group_name "@"

}
