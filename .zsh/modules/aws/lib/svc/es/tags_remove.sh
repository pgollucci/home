aws_es_tags_remove() {
    local arn="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws es  --arn $arn --tag-keys $tag_keys "@"

}
