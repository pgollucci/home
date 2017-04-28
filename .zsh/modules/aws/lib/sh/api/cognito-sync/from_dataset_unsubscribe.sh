aws_cognito-sync_from_dataset_unsubscribe() {
    local identity_pool_id="$1"
    local identity_id="$2"
    local dataset_name="$3"
    local device_id="$4"
    shift 4

    cond_log_and_run aws cognito-sync unsubscribe-from-dataset --identity-pool-id $identity_pool_id --identity-id $identity_id --dataset-name $dataset_name --device-id $device_id "$@"
}
