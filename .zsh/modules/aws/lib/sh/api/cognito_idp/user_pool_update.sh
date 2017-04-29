aws_cognito_idp_user_pool_update() {
    local user_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-idp update-user-pool --user-pool-id $user_pool_id "$@"
}
