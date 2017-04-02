aws_storagegateway_tags_from_resource_remove() {
    local tag-keys="$1"
    local resource-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --tag-keys $tag_keys --resource-arn $resource_arn "@"

}
