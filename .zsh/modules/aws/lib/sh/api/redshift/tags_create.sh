aws_redshift_tags_create() {
    local resource_name="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws redshift create-tags --resource-name $resource_name --tags $tags "$@"
}
