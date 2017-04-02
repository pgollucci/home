aws_configservice_discovered_resources_list() {
    local resource-type="$1"
    shift 1

    log_and_run aws configservice  --resource-type $resource_type "@"

}
