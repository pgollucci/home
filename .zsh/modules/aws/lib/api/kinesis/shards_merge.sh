aws_kinesis_shards_merge() {
    local stream_name="$1"
    local shard_to_merge="$2"
    local adjacent_shard_to_merge="$3"
    shift 3

    cond_log_and_run aws kinesis merge-shards --stream-name $stream_name --shard-to-merge $shard_to_merge --adjacent-shard-to-merge $adjacent_shard_to_merge "$@"
}
