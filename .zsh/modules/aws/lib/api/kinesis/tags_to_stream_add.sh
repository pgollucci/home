aws_kinesis_tags_to_stream_add() {
    local stream_name="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws kinesis add-tags-to-stream --stream-name $stream_name --tags $tags "$@"
}
