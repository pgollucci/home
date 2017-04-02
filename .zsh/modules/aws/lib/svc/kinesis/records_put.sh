aws_kinesis_records_put() {
    local stream-name="$1"
    local records="$2"
    shift 2

    cond_log_and_run aws kinesis  --stream-name $stream_name --records $records "@"

}
