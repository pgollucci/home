aws_elasticache_tags_from_resource_remove() {
    local resource_name="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws elasticache remove-tags-from-resource --resource-name $resource_name --tag-keys $tag_keys "$@"
}
