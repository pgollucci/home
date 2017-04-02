aws_storagegateway_tags_for_resource_list() {
    local resource-arn="$1"
    shift 1

    log_and_run aws storagegateway  --resource-arn $resource_arn "@"

}
