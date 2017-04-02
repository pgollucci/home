aws_cognito-idp_user_pool_client_update() {
    local user-pool-id="$1"
    local client-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --user-pool-id $user_pool_id --client-id $client_id "@"

}
