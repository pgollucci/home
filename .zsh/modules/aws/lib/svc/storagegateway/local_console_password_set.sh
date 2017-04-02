aws_storagegateway_local_console_password_set() {
    local local-console-password="$1"
    local gateway-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --local-console-password $local_console_password --gateway-arn $gateway_arn "@"

}
