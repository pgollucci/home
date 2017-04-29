aws_cognito_identity_open_id_token_for_developer_identity_get() {
    local identity_pool_id="$1"
    local logins="$2"
    shift 2

    log_and_run aws cognito-identity get-open-id-token-for-developer-identity --identity-pool-id $identity_pool_id --logins $logins "$@"
}
