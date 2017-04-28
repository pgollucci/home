aws_storagegateway_bandwidth_rate_limit_delete() {
    local gateway_arn="$1"
    local bandwidth_type="$2"
    shift 2

    cond_log_and_run aws storagegateway delete-bandwidth-rate-limit --gateway-arn $gateway_arn --bandwidth-type $bandwidth_type "$@"
}
