aws_cognito_sync_records_update() {
    local identity_pool_id="$1"
    local identity_id="$2"
    local dataset_name="$3"
    local sync_session_token="$4"
    shift 4

    cond_log_and_run aws cognito-sync update-records --identity-pool-id $identity_pool_id --identity-id $identity_id --dataset-name $dataset_name --sync-session-token $sync_session_token "$@"
}
