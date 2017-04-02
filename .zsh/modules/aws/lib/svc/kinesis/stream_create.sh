aws_kinesis_stream_create() {
    local shard-count="$1"
    local stream-name="$2"
    shift 2

    cond_log_and_run aws kinesis  --shard-count $shard_count --stream-name $stream_name "@"

}
