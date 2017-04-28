aws_cognito-idp_device_status_update() {
    local access_token="$1"
    local device_key="$2"
    shift 2

    cond_log_and_run aws cognito-idp update-device-status --access-token $access_token --device-key $device_key "$@"
}
