aws_cognito-sync_identity_usage_describe() {
    local identity-pool-id="$1"
    local identity-id="$2"
    shift 2

    log_and_run aws cognito-sync  --identity-pool-id $identity_pool_id --identity-id $identity_id "@"

}
