aws_cognito_sync_cognito_events_set() {
    local identity_pool_id="$1"
    local events="$2"
    shift 2

    cond_log_and_run aws cognito-sync set-cognito-events --identity-pool-id $identity_pool_id --events $events "$@"
}
