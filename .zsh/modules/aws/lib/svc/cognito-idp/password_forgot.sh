aws_cognito-idp_password_forgot() {
    local username="$1"
    local client-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --username $username --client-id $client_id "@"

}
