aws_cognito-sync_dataset_describe() {
    local identity-id="$1"
    local identity-pool-id="$2"
    local dataset-name="$3"
    shift 3

    log_and_run aws cognito-sync  --identity-id $identity_id --identity-pool-id $identity_pool_id --dataset-name $dataset_name "@"

}
