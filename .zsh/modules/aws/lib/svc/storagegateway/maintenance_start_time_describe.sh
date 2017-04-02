aws_storagegateway_maintenance_start_time_describe() {
    local gateway-arn="$1"
    shift 1

    log_and_run aws storagegateway  --gateway-arn $gateway_arn "@"

}
