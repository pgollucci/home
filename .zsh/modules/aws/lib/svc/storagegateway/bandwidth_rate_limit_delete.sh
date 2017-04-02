aws_storagegateway_bandwidth_rate_limit_delete() {
    local bandwidth-type="$1"
    local gateway-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --bandwidth-type $bandwidth_type --gateway-arn $gateway_arn "@"

}
