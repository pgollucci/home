aws_dynamodbstreams_shard_iterator_get() {
    local shard-iterator-type="$1"
    local stream-arn="$2"
    local shard-id="$3"
    shift 3

    log_and_run aws dynamodbstreams  --shard-iterator-type $shard_iterator_type --stream-arn $stream_arn --shard-id $shard_id "@"

}
