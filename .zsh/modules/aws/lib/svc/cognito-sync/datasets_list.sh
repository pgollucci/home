aws_cognito-sync_datasets_list() {
    local identity-id="$1"
    local identity-pool-id="$2"
    shift 2

    log_and_run aws cognito-sync  --identity-id $identity_id --identity-pool-id $identity_pool_id "@"

}
