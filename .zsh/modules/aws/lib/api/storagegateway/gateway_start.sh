aws_storagegateway_gateway_start() {
    local gateway_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway start-gateway --gateway-arn $gateway_arn "$@"
}
