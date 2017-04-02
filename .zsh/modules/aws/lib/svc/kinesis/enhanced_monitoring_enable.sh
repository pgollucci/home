aws_kinesis_enhanced_monitoring_enable() {
    local shard-level-metrics="$1"
    local stream-name="$2"
    shift 2

    cond_log_and_run aws kinesis  --shard-level-metrics $shard_level_metrics --stream-name $stream_name "@"

}
