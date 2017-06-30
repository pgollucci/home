aws_dax_resource_untag() {
    local resource_name="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws dax untag-resource --resource-name $resource_name --tag-keys $tag_keys "$@"
}
