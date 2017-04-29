aws_cognito_identity_identity_pool_roles_get() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-identity get-identity-pool-roles --identity-pool-id $identity_pool_id "$@"
}
