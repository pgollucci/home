aws_storagegateway_gateway_shutdown() {
    local gateway_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway shutdown-gateway --gateway-arn $gateway_arn "$@"
}
