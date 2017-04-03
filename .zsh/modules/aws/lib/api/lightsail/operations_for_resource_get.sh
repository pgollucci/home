aws_lightsail_operations_for_resource_get() {
    local resource_name="$1"
    shift 1

    log_and_run aws lightsail get-operations-for-resource --resource-name $resource_name "$@"
}
