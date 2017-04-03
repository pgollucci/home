aws_cognito-idp_get_device_admin() {
    local device_key="$1"
    local user_pool_id="$2"
    local username="$3"
    shift 3

    log_and_run aws cognito-idp admin-get-device --device-key $device_key --user-pool-id $user_pool_id --username $username "$@"
}
