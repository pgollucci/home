aws_dynamodbstreams_records_get() {
    local shard-iterator="$1"
    shift 1

    log_and_run aws dynamodbstreams  --shard-iterator $shard_iterator "@"

}
