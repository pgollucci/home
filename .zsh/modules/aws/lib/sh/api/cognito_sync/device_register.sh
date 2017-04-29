aws_cognito_sync_device_register() {
    local identity_pool_id="$1"
    local identity_id="$2"
    local platform="$3"
    local token="$4"
    shift 4

    cond_log_and_run aws cognito-sync register-device --identity-pool-id $identity_pool_id --identity-id $identity_id --platform $platform --token $token "$@"
}
