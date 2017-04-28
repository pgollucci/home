aws_dynamodbstreams_shard_iterator_get() {
    local stream_arn="$1"
    local shard_id="$2"
    local shard_iterator_type="$3"
    shift 3

    log_and_run aws dynamodbstreams get-shard-iterator --stream-arn $stream_arn --shard-id $shard_id --shard-iterator-type $shard_iterator_type "$@"
}
