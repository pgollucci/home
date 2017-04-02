aws_cognito-idp_device_confirm() {
    local device-key="$1"
    local access-token="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --device-key $device_key --access-token $access_token "@"

}
