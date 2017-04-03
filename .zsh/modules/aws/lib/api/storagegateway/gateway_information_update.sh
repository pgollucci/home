aws_storagegateway_gateway_information_update() {
    local gateway_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway update-gateway-information --gateway-arn $gateway_arn "$@"
}
