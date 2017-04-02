aws_rds_tags_from_resource_remove() {
    local resource-name="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws rds  --resource-name $resource_name --tag-keys $tag_keys "@"

}
