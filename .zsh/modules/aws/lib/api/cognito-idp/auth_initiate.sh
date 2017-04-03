aws_cognito-idp_auth_initiate() {
    local auth_flow="$1"
    local client_id="$2"
    shift 2

    cond_log_and_run aws cognito-idp initiate-auth --auth-flow $auth_flow --client-id $client_id "$@"
}
