aws_storagegateway_tapes_create() {
    local gateway_arn="$1"
    local tape_size_in_bytes="$2"
    local client_token="$3"
    local num_tapes_to_create="$4"
    local tape_barcode_prefix="$5"
    shift 5

    cond_log_and_run aws storagegateway create-tapes --gateway-arn $gateway_arn --tape-size-in-bytes $tape_size_in_bytes --client-token $client_token --num-tapes-to-create $num_tapes_to_create --tape-barcode-prefix $tape_barcode_prefix "$@"
}
