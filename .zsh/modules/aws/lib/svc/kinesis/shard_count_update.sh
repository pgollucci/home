aws_kinesis_shard_count_update() {
    local target-shard-count="$1"
    local scaling-type="$2"
    local stream-name="$3"
    shift 3

    cond_log_and_run aws kinesis  --target-shard-count $target_shard_count --scaling-type $scaling_type --stream-name $stream_name "@"

}
