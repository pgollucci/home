aws_kinesis_shard_iterator_get() {
    local stream_name="$1"
    local shard_id="$2"
    local shard_iterator_type="$3"
    shift 3

    log_and_run aws kinesis get-shard-iterator --stream-name $stream_name --shard-id $shard_id --shard-iterator-type $shard_iterator_type "$@"
}
