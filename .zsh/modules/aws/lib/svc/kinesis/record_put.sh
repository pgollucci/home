aws_kinesis_record_put() {
    local data="$1"
    local stream-name="$2"
    local partition-key="$3"
    shift 3

    cond_log_and_run aws kinesis  --data $data --stream-name $stream_name --partition-key $partition_key "@"

}
