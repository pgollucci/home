aws_cognito-idp_forgot_password_confirm() {
    local password="$1"
    local username="$2"
    local client-id="$3"
    local confirmation-code="$4"
    shift 4

    cond_log_and_run aws cognito-idp  --password $password --username $username --client-id $client_id --confirmation-code $confirmation_code "@"

}
