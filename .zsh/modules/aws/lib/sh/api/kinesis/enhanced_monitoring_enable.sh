aws_kinesis_enhanced_monitoring_enable() {
    local stream_name="$1"
    local shard_level_metrics="$2"
    shift 2

    cond_log_and_run aws kinesis enable-enhanced-monitoring --stream-name $stream_name --shard-level-metrics $shard_level_metrics "$@"
}
