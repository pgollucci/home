aws_cognito-sync_cognito_events_get() {
    local identity-pool-id="$1"
    shift 1

    log_and_run aws cognito-sync  --identity-pool-id $identity_pool_id "@"

}
