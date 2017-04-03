aws_configservice_discovered_resources_list() {
    local resource_type="$1"
    shift 1

    log_and_run aws configservice list-discovered-resources --resource-type $resource_type "$@"
}
