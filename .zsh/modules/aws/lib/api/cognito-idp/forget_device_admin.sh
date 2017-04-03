aws_cognito-idp_forget_device_admin() {
    local user_pool_id="$1"
    local username="$2"
    local device_key="$3"
    shift 3

    log_and_run aws cognito-idp admin-forget-device --user-pool-id $user_pool_id --username $username --device-key $device_key "$@"
}
