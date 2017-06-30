aws_cognito_idp_user_get() {
    local access_token="$1"
    shift 1

    log_and_run aws cognito-idp get-user --access-token $access_token "$@"
}
