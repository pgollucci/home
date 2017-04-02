aws_cognito-idp_devices_list() {
    local access-token="$1"
    shift 1

    log_and_run aws cognito-idp  --access-token $access_token "@"

}
