aws_kinesis_stream_create() {
    local stream_name="$1"
    local shard_count="$2"
    shift 2

    cond_log_and_run aws kinesis create-stream --stream-name $stream_name --shard-count $shard_count "$@"
}
