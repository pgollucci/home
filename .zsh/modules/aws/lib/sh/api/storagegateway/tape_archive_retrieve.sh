aws_storagegateway_tape_archive_retrieve() {
    local tape_arn="$1"
    local gateway_arn="$2"
    shift 2

    cond_log_and_run aws storagegateway retrieve-tape-archive --tape-arn $tape_arn --gateway-arn $gateway_arn "$@"
}
