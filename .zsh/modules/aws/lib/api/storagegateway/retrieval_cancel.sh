aws_storagegateway_retrieval_cancel() {
    local gateway_arn="$1"
    local tape_arn="$2"
    shift 2

    cond_log_and_run aws storagegateway cancel-retrieval --gateway-arn $gateway_arn --tape-arn $tape_arn "$@"
}
