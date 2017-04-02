aws_storagegateway_tape_delete() {
    local gateway-arn="$1"
    local tape-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --gateway-arn $gateway_arn --tape-arn $tape_arn "@"

}
