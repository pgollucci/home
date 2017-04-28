aws_dms_tags_from_resource_remove() {
    local resource_arn="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws dms remove-tags-from-resource --resource-arn $resource_arn --tag-keys $tag_keys "$@"
}
