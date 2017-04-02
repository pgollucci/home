aws_cognito-idp_set_user_settings_admin() {
    local mfa-options="$1"
    local username="$2"
    local user-pool-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --mfa-options $mfa_options --username $username --user-pool-id $user_pool_id "@"

}
