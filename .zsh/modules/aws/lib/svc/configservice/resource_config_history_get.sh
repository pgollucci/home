aws_configservice_resource_config_history_get() {
    local resource-id="$1"
    local resource-type="$2"
    shift 2

    log_and_run aws configservice  --resource-id $resource_id --resource-type $resource_type "@"

}
