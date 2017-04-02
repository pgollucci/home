aws_workspaces_tags_describe() {
    local resource-id="$1"
    shift 1

    log_and_run aws workspaces  --resource-id $resource_id "@"

}
