aws_cognito-sync_cognito_events_set() {
    local events="$1"
    local identity-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-sync  --events $events --identity-pool-id $identity_pool_id "@"

}
