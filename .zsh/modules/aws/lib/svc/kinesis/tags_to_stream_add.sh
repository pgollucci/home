aws_kinesis_tags_to_stream_add() {
    local stream-name="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws kinesis  --stream-name $stream_name --tags $tags "@"

}
