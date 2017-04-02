aws_workspaces_tags_delete() {
    local resource-id="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws workspaces  --resource-id $resource_id --tag-keys $tag_keys "@"

}
