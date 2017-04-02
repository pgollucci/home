aws_storagegateway_bandwidth_rate_limit_describe() {
    local gateway-arn="$1"
    shift 1

    log_and_run aws storagegateway  --gateway-arn $gateway_arn "@"

}
