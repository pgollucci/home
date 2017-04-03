aws_workspaces_tags_delete() {
    local resource_id="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws workspaces delete-tags --resource-id $resource_id --tag-keys $tag_keys "$@"
}
