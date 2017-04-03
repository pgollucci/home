aws_storagegateway_chap_credentials_delete() {
    local target_arn="$1"
    local initiator_name="$2"
    shift 2

    cond_log_and_run aws storagegateway delete-chap-credentials --target-arn $target_arn --initiator-name $initiator_name "$@"
}
