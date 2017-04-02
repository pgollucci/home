aws_cognito-sync_from_dataset_unsubscribe() {
    local dataset-name="$1"
    local device-id="$2"
    local identity-pool-id="$3"
    local identity-id="$4"
    shift 4

    cond_log_and_run aws cognito-sync  --dataset-name $dataset_name --device-id $device_id --identity-pool-id $identity_pool_id --identity-id $identity_id "@"

}
