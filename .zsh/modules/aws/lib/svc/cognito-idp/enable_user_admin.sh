aws_cognito-idp_enable_user_admin() {
    local username="$1"
    local user-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --username $username --user-pool-id $user_pool_id "@"

}
