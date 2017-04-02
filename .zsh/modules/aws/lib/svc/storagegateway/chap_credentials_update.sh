aws_storagegateway_chap_credentials_update() {
    local target-arn="$1"
    local initiator-name="$2"
    local secret-to-authenticate-initiator="$3"
    shift 3

    cond_log_and_run aws storagegateway  --target-arn $target_arn --initiator-name $initiator_name --secret-to-authenticate-initiator $secret_to_authenticate_initiator "@"

}
