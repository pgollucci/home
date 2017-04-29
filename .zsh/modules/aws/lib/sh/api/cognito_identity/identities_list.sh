aws_cognito_identity_identities_list() {
    local identity_pool_id="$1"
    local max_results="$2"
    shift 2

    log_and_run aws cognito-identity list-identities --identity-pool-id $identity_pool_id --max-results $max_results "$@"
}
