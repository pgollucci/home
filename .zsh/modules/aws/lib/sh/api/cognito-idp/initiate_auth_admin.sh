aws_cognito-idp_initiate_auth_admin() {
    local user_pool_id="$1"
    local client_id="$2"
    local auth_flow="$3"
    shift 3

    cond_log_and_run aws cognito-idp admin-initiate-auth --user-pool-id $user_pool_id --client-id $client_id --auth-flow $auth_flow "$@"
}
