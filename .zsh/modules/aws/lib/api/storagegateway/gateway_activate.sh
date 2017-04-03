aws_storagegateway_gateway_activate() {
    local activation_key="$1"
    local gateway_name="$2"
    local gateway_timezone="$3"
    local gateway_region="$4"
    shift 4

    cond_log_and_run aws storagegateway activate-gateway --activation-key $activation_key --gateway-name $gateway_name --gateway-timezone $gateway_timezone --gateway-region $gateway_region "$@"
}
