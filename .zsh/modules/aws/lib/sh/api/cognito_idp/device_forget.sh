aws_cognito_idp_device_forget() {
    local device_key="$1"
    shift 1

    log_and_run aws cognito-idp forget-device --device-key $device_key "$@"
}
