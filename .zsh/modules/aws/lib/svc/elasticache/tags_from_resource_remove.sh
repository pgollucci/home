aws_elasticache_tags_from_resource_remove() {
    local tag-keys="$1"
    local resource-name="$2"
    shift 2

    cond_log_and_run aws elasticache  --tag-keys $tag_keys --resource-name $resource_name "@"

}
