aws_cognito-sync_cognito_events_get() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-sync get-cognito-events --identity-pool-id $identity_pool_id "$@"
}
