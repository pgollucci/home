aws_redshift_tags_delete() {
    local resource-name="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws redshift  --resource-name $resource_name --tag-keys $tag_keys "@"

}
