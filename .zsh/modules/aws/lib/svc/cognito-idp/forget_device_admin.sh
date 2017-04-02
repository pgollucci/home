aws_cognito-idp_forget_device_admin() {
    local device-key="$1"
    local username="$2"
    local user-pool-id="$3"
    shift 3

    log_and_run aws cognito-idp  --device-key $device_key --username $username --user-pool-id $user_pool_id "@"

}
