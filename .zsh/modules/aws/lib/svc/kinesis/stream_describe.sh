aws_kinesis_stream_describe() {
    local stream-name="$1"
    shift 1

    log_and_run aws kinesis  --stream-name $stream_name "@"

}
