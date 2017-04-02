aws_elasticache_tags_for_resource_list() {
    local resource-name="$1"
    shift 1

    log_and_run aws elasticache  --resource-name $resource_name "@"

}
