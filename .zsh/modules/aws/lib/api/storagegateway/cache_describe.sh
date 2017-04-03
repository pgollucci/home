aws_storagegateway_cache_describe() {
    local gateway_arn="$1"
    shift 1

    log_and_run aws storagegateway describe-cache --gateway-arn $gateway_arn "$@"
}
