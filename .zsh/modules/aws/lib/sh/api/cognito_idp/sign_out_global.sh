aws_cognito_idp_sign_out_global() {
    local access_token="$1"
    shift 1

    cond_log_and_run aws cognito-idp global-sign-out --access-token $access_token "$@"
}
