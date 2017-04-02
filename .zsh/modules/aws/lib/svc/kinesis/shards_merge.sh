aws_kinesis_shards_merge() {
    local adjacent-shard-to-merge="$1"
    local shard-to-merge="$2"
    local stream-name="$3"
    shift 3

    cond_log_and_run aws kinesis  --adjacent-shard-to-merge $adjacent_shard_to_merge --shard-to-merge $shard_to_merge --stream-name $stream_name "@"

}
