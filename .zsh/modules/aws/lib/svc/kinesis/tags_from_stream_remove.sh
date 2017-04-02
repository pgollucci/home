aws_kinesis_tags_from_stream_remove() {
    local stream-name="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws kinesis  --stream-name $stream_name --tag-keys $tag_keys "@"

}
