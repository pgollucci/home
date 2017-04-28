aws_logs_log_streams_describe() {
    local log_group_name="$1"
    shift 1

    log_and_run aws logs describe-log-streams --log-group-name $log_group_name "$@"
}
