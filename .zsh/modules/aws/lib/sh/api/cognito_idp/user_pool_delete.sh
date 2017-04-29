aws_cognito_idp_user_pool_delete() {
    local user_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-idp delete-user-pool --user-pool-id $user_pool_id "$@"
}
