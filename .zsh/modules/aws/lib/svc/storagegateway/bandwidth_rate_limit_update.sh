aws_storagegateway_bandwidth_rate_limit_update() {
    local gateway-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --gateway-arn $gateway_arn "@"

}
