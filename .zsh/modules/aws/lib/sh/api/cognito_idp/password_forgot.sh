aws_cognito_idp_password_forgot() {
    local client_id="$1"
    local username="$2"
    shift 2

    cond_log_and_run aws cognito-idp forgot-password --client-id $client_id --username $username "$@"
}
