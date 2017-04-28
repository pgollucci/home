aws_devicefarm_device_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-device --arn $arn "$@"
}
