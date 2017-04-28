aws_devicefarm_device_pool_compatibility_get() {
    local device_pool_arn="$1"
    shift 1

    log_and_run aws devicefarm get-device-pool-compatibility --device-pool-arn $device_pool_arn "$@"
}
