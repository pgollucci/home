aws_directconnect_resource_untag() {
    local tag-keys="$1"
    local resource-arn="$2"
    shift 2

    cond_log_and_run aws directconnect  --tag-keys $tag_keys --resource-arn $resource_arn "@"

}
