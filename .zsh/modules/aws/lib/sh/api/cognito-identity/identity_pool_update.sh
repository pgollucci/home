aws_cognito-identity_identity_pool_update() {
    local identity_pool_id="$1"
    local identity_pool_name="$2"
    local allow_unauthenticated_identities="$3"
    shift 3

    cond_log_and_run aws cognito-identity update-identity-pool --identity-pool-id $identity_pool_id --identity-pool-name $identity_pool_name --allow-unauthenticated-identities $allow_unauthenticated_identities "$@"
}
