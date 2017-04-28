aws_cognito-idp_user_global_sign_out_admin() {
    local user_pool_id="$1"
    local username="$2"
    shift 2

    cond_log_and_run aws cognito-idp admin-user-global-sign-out --user-pool-id $user_pool_id --username $username "$@"
}
