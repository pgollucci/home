aws_devicefarm_device_pools_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-device-pools --arn $arn "$@"
}
