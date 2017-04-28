aws_elasticache_tags_for_resource_list() {
    local resource_name="$1"
    shift 1

    log_and_run aws elasticache list-tags-for-resource --resource-name $resource_name "$@"
}
