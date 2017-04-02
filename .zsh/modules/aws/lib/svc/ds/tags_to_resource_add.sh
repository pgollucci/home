aws_ds_tags_to_resource_add() {
    local tags="$1"
    local resource-id="$2"
    shift 2

    cond_log_and_run aws ds  --tags $tags --resource-id $resource_id "@"

}
