aws_cognito-sync_records_list() {
    local dataset-name="$1"
    local identity-id="$2"
    local identity-pool-id="$3"
    shift 3

    log_and_run aws cognito-sync  --dataset-name $dataset_name --identity-id $identity_id --identity-pool-id $identity_pool_id "@"

}
