aws_kinesis_stream_describe() {
    local stream_name="$1"
    shift 1

    log_and_run aws kinesis describe-stream --stream-name $stream_name "$@"
}
