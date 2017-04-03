aws_logs_log_stream_create() {
    local log_group_name="$1"
    local log_stream_name="$2"
    shift 2

    cond_log_and_run aws logs create-log-stream --log-group-name $log_group_name --log-stream-name $log_stream_name "$@"
}
