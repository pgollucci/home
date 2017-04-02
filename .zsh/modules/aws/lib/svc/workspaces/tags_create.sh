aws_workspaces_tags_create() {
    local tags="$1"
    local resource-id="$2"
    shift 2

    cond_log_and_run aws workspaces  --tags $tags --resource-id $resource_id "@"

}
