aws_inspector_resource_group_create() {
    local resource-group-tags="$1"
    shift 1

    cond_log_and_run aws inspector  --resource-group-tags $resource_group_tags "@"

}
