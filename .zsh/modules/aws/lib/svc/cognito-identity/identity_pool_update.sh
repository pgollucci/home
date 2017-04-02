aws_cognito-identity_identity_pool_update() {
    local allow-unauthenticated-identities="$1"
    local identity-pool-id="$2"
    local identity-pool-name="$3"
    shift 3

    cond_log_and_run aws cognito-identity  --allow-unauthenticated-identities $allow_unauthenticated_identities --identity-pool-id $identity_pool_id --identity-pool-name $identity_pool_name "@"

}
