aws_cognito-sync_to_dataset_subscribe() {
    local identity-id="$1"
    local identity-pool-id="$2"
    local device-id="$3"
    local dataset-name="$4"
    shift 4

    cond_log_and_run aws cognito-sync  --identity-id $identity_id --identity-pool-id $identity_pool_id --device-id $device_id --dataset-name $dataset_name "@"

}
