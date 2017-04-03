aws_storagegateway_cache_add() {
    local gateway_arn="$1"
    local disk_ids="$2"
    shift 2

    cond_log_and_run aws storagegateway add-cache --gateway-arn $gateway_arn --disk-ids $disk_ids "$@"
}
