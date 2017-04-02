aws_storagegateway_tags_to_resource_add() {
    local resource-arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws storagegateway  --resource-arn $resource_arn --tags $tags "@"

}
