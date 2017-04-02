aws_elbv2_tags_remove() {
    local tag-keys="$1"
    local resource-arns="$2"
    shift 2

    cond_log_and_run aws elbv2  --tag-keys $tag_keys --resource-arns $resource_arns "@"

}
