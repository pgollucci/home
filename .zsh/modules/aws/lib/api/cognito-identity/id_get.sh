aws_cognito-identity_id_get() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-identity get-id --identity-pool-id $identity_pool_id "$@"
}
