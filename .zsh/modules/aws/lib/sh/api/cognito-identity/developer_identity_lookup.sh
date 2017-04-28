aws_cognito-identity_developer_identity_lookup() {
    local identity_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-identity lookup-developer-identity --identity-pool-id $identity_pool_id "$@"
}
