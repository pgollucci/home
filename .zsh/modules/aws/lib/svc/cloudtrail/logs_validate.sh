aws_cloudtrail_logs_validate() {
    local start-time="$1"
    local trail-arn="$2"
    shift 2

    cond_log_and_run aws cloudtrail  --start-time $start_time --trail-arn $trail_arn "@"

}
