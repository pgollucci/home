aws_cognito-sync_device_register() {
    local token="$1"
    local identity-pool-id="$2"
    local platform="$3"
    local identity-id="$4"
    shift 4

    cond_log_and_run aws cognito-sync  --token $token --identity-pool-id $identity_pool_id --platform $platform --identity-id $identity_id "@"

}
