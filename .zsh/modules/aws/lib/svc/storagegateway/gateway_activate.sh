aws_storagegateway_gateway_activate() {
    local gateway-region="$1"
    local gateway-name="$2"
    local activation-key="$3"
    local gateway-timezone="$4"
    shift 4

    cond_log_and_run aws storagegateway  --gateway-region $gateway_region --gateway-name $gateway_name --activation-key $activation_key --gateway-timezone $gateway_timezone "@"

}
