aws_cognito_identity_identity_pool_describe() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-identity describe-identity-pool --identity-pool-id $identity_pool_id "$@"
}
