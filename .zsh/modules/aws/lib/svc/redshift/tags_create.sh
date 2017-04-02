aws_redshift_tags_create() {
    local tags="$1"
    local resource-name="$2"
    shift 2

    cond_log_and_run aws redshift  --tags $tags --resource-name $resource_name "@"

}
