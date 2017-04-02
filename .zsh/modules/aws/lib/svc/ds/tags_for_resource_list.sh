aws_ds_tags_for_resource_list() {
    local resource-id="$1"
    shift 1

    log_and_run aws ds  --resource-id $resource_id "@"

}
