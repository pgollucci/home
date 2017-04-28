aws_cloudtrail_logs_validate() {
    local trail_arn="$1"
    local start_time="$2"
    shift 2

    cond_log_and_run aws cloudtrail validate-logs --trail-arn $trail_arn --start-time $start_time "$@"
}
