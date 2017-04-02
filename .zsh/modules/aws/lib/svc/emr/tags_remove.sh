aws_emr_tags_remove() {
    local tag-keys="$1"
    local resource-id="$2"
    shift 2

    cond_log_and_run aws emr  --tag-keys $tag_keys --resource-id $resource_id "@"

}
