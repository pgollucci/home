aws_cognito-identity_identity_pool_roles_get() {
    local identity-pool-id="$1"
    shift 1

    log_and_run aws cognito-identity  --identity-pool-id $identity_pool_id "@"

}
