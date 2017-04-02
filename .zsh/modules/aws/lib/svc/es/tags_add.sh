aws_es_tags_add() {
    local tag-list="$1"
    local arn="$2"
    shift 2

    cond_log_and_run aws es  --tag-list $tag_list --arn $arn "@"

}
