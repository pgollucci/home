aws_workspaces_tags_create() {
    local resource_id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws workspaces create-tags --resource-id $resource_id --tags $tags "$@"
}
