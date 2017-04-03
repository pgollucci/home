aws_cognito-sync_identity_pool_configuration_set() {
    local identity_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-sync set-identity-pool-configuration --identity-pool-id $identity_pool_id "$@"
}
