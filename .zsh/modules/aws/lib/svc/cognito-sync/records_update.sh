aws_cognito-sync_records_update() {
    local identity-pool-id="$1"
    local identity-id="$2"
    local dataset-name="$3"
    local sync-session-token="$4"
    shift 4

    cond_log_and_run aws cognito-sync  --identity-pool-id $identity_pool_id --identity-id $identity_id --dataset-name $dataset_name --sync-session-token $sync_session_token "@"

}
