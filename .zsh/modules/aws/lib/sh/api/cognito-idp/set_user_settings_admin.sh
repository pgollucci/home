aws_cognito-idp_set_user_settings_admin() {
    local user_pool_id="$1"
    local username="$2"
    local mfa_options="$3"
    shift 3

    cond_log_and_run aws cognito-idp admin-set-user-settings --user-pool-id $user_pool_id --username $username --mfa-options $mfa_options "$@"
}
