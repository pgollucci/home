aws_cognito-sync_identity_pool_usage_describe() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-sync describe-identity-pool-usage --identity-pool-id $identity_pool_id "$@"
}
