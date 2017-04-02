aws_cognito-idp_auth_initiate() {
    local auth-flow="$1"
    local client-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --auth-flow $auth_flow --client-id $client_id "@"

}
