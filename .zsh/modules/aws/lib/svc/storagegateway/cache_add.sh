aws_storagegateway_cache_add() {
    local gateway-arn="$1"
    local disk-ids="$2"
    shift 2

    cond_log_and_run aws storagegateway  --gateway-arn $gateway_arn --disk-ids $disk_ids "@"

}
