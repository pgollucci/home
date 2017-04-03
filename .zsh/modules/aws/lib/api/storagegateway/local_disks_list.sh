aws_storagegateway_local_disks_list() {
    local gateway_arn="$1"
    shift 1

    log_and_run aws storagegateway list-local-disks --gateway-arn $gateway_arn "$@"
}
