aws_cognito_sync_dataset_describe() {
    local identity_pool_id="$1"
    local identity_id="$2"
    local dataset_name="$3"
    shift 3

    log_and_run aws cognito-sync describe-dataset --identity-pool-id $identity_pool_id --identity-id $identity_id --dataset-name $dataset_name "$@"
}
