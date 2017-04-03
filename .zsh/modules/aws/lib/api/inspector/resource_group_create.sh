aws_inspector_resource_group_create() {
    local resource_group_tags="$1"
    shift 1

    cond_log_and_run aws inspector create-resource-group --resource-group-tags $resource_group_tags "$@"
}
