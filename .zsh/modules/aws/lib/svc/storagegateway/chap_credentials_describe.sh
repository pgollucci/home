aws_storagegateway_chap_credentials_describe() {
    local target-arn="$1"
    shift 1

    log_and_run aws storagegateway  --target-arn $target_arn "@"

}
