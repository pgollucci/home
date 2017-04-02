aws_storagegateway_cache_reset() {
    local gateway-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --gateway-arn $gateway_arn "@"

}
