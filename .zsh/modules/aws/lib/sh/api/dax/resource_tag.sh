aws_dax_resource_tag() {
    local resource_name="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws dax tag-resource --resource-name $resource_name --tags $tags "$@"
}
