aws_cognito-idp_initiate_auth_admin() {
    local auth-flow="$1"
    local user-pool-id="$2"
    local client-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --auth-flow $auth_flow --user-pool-id $user_pool_id --client-id $client_id "@"

}
