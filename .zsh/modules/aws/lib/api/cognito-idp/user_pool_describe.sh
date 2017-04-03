aws_cognito-idp_user_pool_describe() {
    local user_pool_id="$1"
    shift 1

    log_and_run aws cognito-idp describe-user-pool --user-pool-id $user_pool_id "$@"
}
