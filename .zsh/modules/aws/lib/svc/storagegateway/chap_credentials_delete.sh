aws_storagegateway_chap_credentials_delete() {
    local initiator-name="$1"
    local target-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --initiator-name $initiator_name --target-arn $target_arn "@"

}
