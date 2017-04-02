aws_kinesis_stream_delete() {
    local stream-name="$1"
    shift 1

    cond_log_and_run aws kinesis  --stream-name $stream_name "@"

}
