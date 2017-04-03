aws_rds_tags_from_resource_remove() {
    local resource_name="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws rds remove-tags-from-resource --resource-name $resource_name --tag-keys $tag_keys "$@"
}
