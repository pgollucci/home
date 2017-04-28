aws_storagegateway_working_storage_describe() {
    local gateway_arn="$1"
    shift 1

    log_and_run aws storagegateway describe-working-storage --gateway-arn $gateway_arn "$@"
}
