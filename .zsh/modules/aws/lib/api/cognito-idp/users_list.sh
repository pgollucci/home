aws_cognito-idp_users_list() {
    local user_pool_id="$1"
    shift 1

    log_and_run aws cognito-idp list-users --user-pool-id $user_pool_id "$@"
}
