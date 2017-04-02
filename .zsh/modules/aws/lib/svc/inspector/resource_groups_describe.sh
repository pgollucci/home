aws_inspector_resource_groups_describe() {
    local resource-group-arns="$1"
    shift 1

    log_and_run aws inspector  --resource-group-arns $resource_group_arns "@"

}
