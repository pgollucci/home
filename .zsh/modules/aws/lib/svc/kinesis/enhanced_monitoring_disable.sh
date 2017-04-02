aws_kinesis_enhanced_monitoring_disable() {
    local stream-name="$1"
    local shard-level-metrics="$2"
    shift 2

    cond_log_and_run aws kinesis  --stream-name $stream_name --shard-level-metrics $shard_level_metrics "@"

}
