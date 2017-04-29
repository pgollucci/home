aws_resourcegroupstaggingapi_resources_tag() {
    local resource_arn_list="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws resourcegroupstaggingapi tag-resources --resource-arn-list $resource_arn_list --tags $tags "$@"
}
