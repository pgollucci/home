aws_configservice_resource_config_history_get() {
    local resource_type="$1"
    local resource_id="$2"
    shift 2

    log_and_run aws configservice get-resource-config-history --resource-type $resource_type --resource-id $resource_id "$@"
}
