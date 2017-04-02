aws_cognito-idp_user_settings_set() {
    local access-token="$1"
    local mfa-options="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --access-token $access_token --mfa-options $mfa_options "@"

}
