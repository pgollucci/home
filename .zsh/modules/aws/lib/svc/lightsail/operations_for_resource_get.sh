aws_lightsail_operations_for_resource_get() {
    local resource-name="$1"
    shift 1

    log_and_run aws lightsail  --resource-name $resource_name "@"

}
