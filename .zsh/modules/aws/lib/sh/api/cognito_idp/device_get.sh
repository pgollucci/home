aws_cognito_idp_device_get() {
    local device_key="$1"
    shift 1

    log_and_run aws cognito-idp get-device --device-key $device_key "$@"
}
