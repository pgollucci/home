aws_cognito_idp_forgot_password_confirm() {
    local client_id="$1"
    local username="$2"
    local confirmation_code="$3"
    local password="$4"
    shift 4

    cond_log_and_run aws cognito-idp confirm-forgot-password --client-id $client_id --username $username --confirmation-code $confirmation_code --password $password "$@"
}
