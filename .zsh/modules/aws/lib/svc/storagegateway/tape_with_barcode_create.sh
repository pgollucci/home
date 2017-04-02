aws_storagegateway_tape_with_barcode_create() {
    local tape-size-in-bytes="$1"
    local gateway-arn="$2"
    local tape-barcode="$3"
    shift 3

    cond_log_and_run aws storagegateway  --tape-size-in-bytes $tape_size_in_bytes --gateway-arn $gateway_arn --tape-barcode $tape_barcode "@"

}
