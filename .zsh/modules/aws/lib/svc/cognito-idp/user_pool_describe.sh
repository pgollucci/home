aws_cognito-idp_user_pool_describe() {
    local user-pool-id="$1"
    shift 1

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id "@"

}
