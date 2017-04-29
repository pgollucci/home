aws_cognito_sync_identity_pool_configuration_get() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-sync get-identity-pool-configuration --identity-pool-id $identity_pool_id "$@"
}
