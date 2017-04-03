aws_redshift_tags_delete() {
    local resource_name="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws redshift delete-tags --resource-name $resource_name --tag-keys $tag_keys "$@"
}
