aws_cognito-idp_device_forget() {
    local device-key="$1"
    shift 1

    log_and_run aws cognito-idp  --device-key $device_key "@"

}
