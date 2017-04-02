aws_storagegateway_volume_recovery_points_list() {
    local gateway-arn="$1"
    shift 1

    log_and_run aws storagegateway  --gateway-arn $gateway_arn "@"

}
