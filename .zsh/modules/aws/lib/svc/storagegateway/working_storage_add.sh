aws_storagegateway_working_storage_add() {
    local disk-ids="$1"
    local gateway-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --disk-ids $disk_ids --gateway-arn $gateway_arn "@"

}
