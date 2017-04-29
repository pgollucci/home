aws_cognito_identity_identity_pool_create() {
    local identity_pool_name="$1"
    local allow_unauthenticated_identities="$2"
    shift 2

    cond_log_and_run aws cognito-identity create-identity-pool --identity-pool-name $identity_pool_name --allow-unauthenticated-identities $allow_unauthenticated_identities "$@"
}
