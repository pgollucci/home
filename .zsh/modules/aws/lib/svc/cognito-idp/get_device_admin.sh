aws_cognito-idp_get_device_admin() {
    local user-pool-id="$1"
    local username="$2"
    local device-key="$3"
    shift 3

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id --username $username --device-key $device_key "@"

}
