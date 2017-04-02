aws_cognito-idp_device_status_update() {
    local access-token="$1"
    local device-key="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --access-token $access_token --device-key $device_key "@"

}
