aws_kinesis_tags_for_stream_list() {
    local stream-name="$1"
    shift 1

    log_and_run aws kinesis  --stream-name $stream_name "@"

}
