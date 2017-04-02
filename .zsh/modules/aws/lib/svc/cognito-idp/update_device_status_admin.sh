aws_cognito-idp_update_device_status_admin() {
    local user-pool-id="$1"
    local username="$2"
    local device-key="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --user-pool-id $user_pool_id --username $username --device-key $device_key "@"

}
