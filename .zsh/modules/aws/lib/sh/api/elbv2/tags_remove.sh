aws_elbv2_tags_remove() {
    local resource_arns="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws elbv2 remove-tags --resource-arns $resource_arns --tag-keys $tag_keys "$@"
}
