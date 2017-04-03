aws_dynamodbstreams_records_get() {
    local shard_iterator="$1"
    shift 1

    log_and_run aws dynamodbstreams get-records --shard-iterator $shard_iterator "$@"
}
