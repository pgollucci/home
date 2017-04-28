aws_es_tags_remove() {
    local arn="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws es remove-tags --arn $arn --tag-keys $tag_keys "$@"
}
