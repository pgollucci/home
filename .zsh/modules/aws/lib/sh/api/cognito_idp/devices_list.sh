aws_cognito_idp_devices_list() {
    local access_token="$1"
    shift 1

    log_and_run aws cognito-idp list-devices --access-token $access_token "$@"
}
