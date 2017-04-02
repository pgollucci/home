aws_kinesis_shard_iterator_get() {
    local shard-id="$1"
    local stream-name="$2"
    local shard-iterator-type="$3"
    shift 3

    log_and_run aws kinesis  --shard-id $shard_id --stream-name $stream_name --shard-iterator-type $shard_iterator_type "@"

}
