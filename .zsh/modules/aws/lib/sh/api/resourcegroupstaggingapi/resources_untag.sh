aws_resourcegroupstaggingapi_resources_untag() {
    local resource_arn_list="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws resourcegroupstaggingapi untag-resources --resource-arn-list $resource_arn_list --tag-keys $tag_keys "$@"
}
