aws_cognito-identity_identity_pool_create() {
    local allow-unauthenticated-identities="$1"
    local identity-pool-name="$2"
    shift 2

    cond_log_and_run aws cognito-identity  --allow-unauthenticated-identities $allow_unauthenticated_identities --identity-pool-name $identity_pool_name "@"

}
