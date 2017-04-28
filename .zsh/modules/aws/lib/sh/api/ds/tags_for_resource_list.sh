aws_ds_tags_for_resource_list() {
    local resource_id="$1"
    shift 1

    log_and_run aws ds list-tags-for-resource --resource-id $resource_id "$@"
}
