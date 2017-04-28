aws_kinesis_record_put() {
    local stream_name="$1"
    local data="$2"
    local partition_key="$3"
    shift 3

    cond_log_and_run aws kinesis put-record --stream-name $stream_name --data $data --partition-key $partition_key "$@"
}
