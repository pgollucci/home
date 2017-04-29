aws_cognito_idp_user_pool_client_describe() {
    local user_pool_id="$1"
    local client_id="$2"
    shift 2

    log_and_run aws cognito-idp describe-user-pool-client --user-pool-id $user_pool_id --client-id $client_id "$@"
}
