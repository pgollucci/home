aws_storagegateway_archival_cancel() {
    local tape-arn="$1"
    local gateway-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --tape-arn $tape_arn --gateway-arn $gateway_arn "@"

}
