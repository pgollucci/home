aws_kinesis_tags_from_stream_remove() {
    local stream_name="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws kinesis remove-tags-from-stream --stream-name $stream_name --tag-keys $tag_keys "$@"
}
