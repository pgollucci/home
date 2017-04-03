aws_storagegateway_local_console_password_set() {
    local gateway_arn="$1"
    local local_console_password="$2"
    shift 2

    cond_log_and_run aws storagegateway set-local-console-password --gateway-arn $gateway_arn --local-console-password $local_console_password "$@"
}
