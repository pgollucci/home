aws_storagegateway_cache_reset() {
    local gateway_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway reset-cache --gateway-arn $gateway_arn "$@"
}
