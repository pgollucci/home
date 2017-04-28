aws_storagegateway_upload_buffer_describe() {
    local gateway_arn="$1"
    shift 1

    log_and_run aws storagegateway describe-upload-buffer --gateway-arn $gateway_arn "$@"
}
