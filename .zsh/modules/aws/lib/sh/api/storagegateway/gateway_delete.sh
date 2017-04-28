aws_storagegateway_gateway_delete() {
    local gateway_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway delete-gateway --gateway-arn $gateway_arn "$@"
}
