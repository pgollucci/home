aws_ds_tags_from_resource_remove() {
    local resource-id="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws ds  --resource-id $resource_id --tag-keys $tag_keys "@"

}
