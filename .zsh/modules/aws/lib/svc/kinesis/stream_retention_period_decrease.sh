aws_kinesis_stream_retention_period_decrease() {
    local retention-period-hours="$1"
    local stream-name="$2"
    shift 2

    cond_log_and_run aws kinesis  --retention-period-hours $retention_period_hours --stream-name $stream_name "@"

}
