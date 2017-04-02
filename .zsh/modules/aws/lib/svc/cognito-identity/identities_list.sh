aws_cognito-identity_identities_list() {
    local identity-pool-id="$1"
    local max-results="$2"
    shift 2

    log_and_run aws cognito-identity  --identity-pool-id $identity_pool_id --max-results $max_results "@"

}
