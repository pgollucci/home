aws_ds_tags_to_resource_add() {
    local resource_id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws ds add-tags-to-resource --resource-id $resource_id --tags $tags "$@"
}
