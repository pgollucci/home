aws_kinesis_records_get() {
    local shard-iterator="$1"
    shift 1

    log_and_run aws kinesis  --shard-iterator $shard_iterator "@"

}
