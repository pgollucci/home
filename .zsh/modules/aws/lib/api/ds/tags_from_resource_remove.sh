aws_ds_tags_from_resource_remove() {
    local resource_id="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws ds remove-tags-from-resource --resource-id $resource_id --tag-keys $tag_keys "$@"
}
