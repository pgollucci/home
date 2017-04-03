aws_kinesis_records_put() {
    local records="$1"
    local stream_name="$2"
    shift 2

    cond_log_and_run aws kinesis put-records --records $records --stream-name $stream_name "$@"
}
