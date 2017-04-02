aws_cognito-idp_user_pool_client_describe() {
    local client-id="$1"
    local user-pool-id="$2"
    shift 2

    log_and_run aws cognito-idp  --client-id $client_id --user-pool-id $user_pool_id "@"

}
