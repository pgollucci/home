aws_storagegateway_tapes_create() {
    local client-token="$1"
    local gateway-arn="$2"
    local tape-barcode-prefix="$3"
    local tape-size-in-bytes="$4"
    local num-tapes-to-create="$5"
    shift 5

    cond_log_and_run aws storagegateway  --client-token $client_token --gateway-arn $gateway_arn --tape-barcode-prefix $tape_barcode_prefix --tape-size-in-bytes $tape_size_in_bytes --num-tapes-to-create $num_tapes_to_create "@"

}
