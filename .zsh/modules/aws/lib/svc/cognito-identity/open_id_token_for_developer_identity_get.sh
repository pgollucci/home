aws_cognito-identity_open_id_token_for_developer_identity_get() {
    local logins="$1"
    local identity-pool-id="$2"
    shift 2

    log_and_run aws cognito-identity  --logins $logins --identity-pool-id $identity_pool_id "@"

}
