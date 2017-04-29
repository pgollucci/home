aws_cognito_idp_user_pool_client_update() {
    local user_pool_id="$1"
    local client_id="$2"
    shift 2

    cond_log_and_run aws cognito-idp update-user-pool-client --user-pool-id $user_pool_id --client-id $client_id "$@"
}
