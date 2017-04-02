aws_devicefarm_device_pool_update() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm  --arn $arn "@"

}
