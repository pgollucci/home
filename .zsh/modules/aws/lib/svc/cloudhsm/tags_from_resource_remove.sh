aws_cloudhsm_tags_from_resource_remove() {
    local tag-key-list="$1"
    local resource-arn="$2"
    shift 2

    cond_log_and_run aws cloudhsm  --tag-key-list $tag_key_list --resource-arn $resource_arn "@"

}
